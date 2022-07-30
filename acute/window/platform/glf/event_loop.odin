package glf

import "core:fmt"
import "core:time"
import "core:sync"
import "core:container/queue"
import "vendor:glfw"

import "../../core"

State :: enum {
  Start,
  UserEvents,
  UserEventsFinished,
  RedrawEvents,
  RedrawEventsFinished,
  LoopDestroyed,
}

WindowId :: core.WindowId

SharedState :: struct {
  nextId: i64,
  windowHandleToId: map[glfw.WindowHandle]WindowId,
  windows: map[WindowId]^Window,
  redraw_queue: queue.Queue(WindowId),
  redraw_lock: sync.Mutex,
  event_queue: queue.Queue(core.Event),
  event_lock: sync.Mutex,
}

EventLoop :: struct {
  flow: core.ControlFlow,
  target: EventLoopWindowTarget,
  shared: ^SharedState,
  state: State,
}

EventLoopWindowTarget :: struct {
  shared: ^SharedState,
}

EventLoopProc :: #type proc(event: core.Event, target: ^EventLoopWindowTarget, flow: ^core.ControlFlow)

exit :: proc(event_loop: ^EventLoop) -> bool {
  #partial switch event_loop.state {
    case .LoopDestroyed:
      deinit_event_loop(event_loop)
      return true
  }
  return false
}

poll_event :: proc(event_loop: ^EventLoop) -> (event: core.Event, flow: ^core.ControlFlow, target: ^EventLoopWindowTarget, status: core.Status) {
  switch f in event_loop.flow {
    case core.Poll: glfw.PollEvents()
    case core.Wait: glfw.WaitEvents()
    case core.Exit: 
      event_loop.state = .LoopDestroyed
    case core.ExitWithCode: 
      event_loop.state = .LoopDestroyed
    case core.WaitUntil: 
  }
  flow = &event_loop.flow
  target = &event_loop.target
  status = .Ok
  switch event_loop.state {
    case .Start: {
      event_loop.state = .UserEvents
      event = core.EventsStart {}
      return
    }
    case .UserEvents:
      if queue.len(event_loop.shared.event_queue) > 0 {
        sync.lock(&event_loop.shared.event_lock); defer sync.unlock(&event_loop.shared.event_lock)
        event = queue.pop_front(&event_loop.shared.event_queue)
        return
      }
      fallthrough
    case .UserEventsFinished:
      event_loop.state = .RedrawEvents
      event = core.MainEventsCleared {}
      return
    case .RedrawEvents:
      if queue.len(event_loop.shared.redraw_queue) > 0 {
        sync.lock(&event_loop.shared.redraw_lock); defer sync.unlock(&event_loop.shared.redraw_lock)
        id := queue.pop_front(&event_loop.shared.redraw_queue)
        event = core.RedrawRquested { 
          id = id,
        }
        return
      }
      fallthrough
    case .RedrawEventsFinished:
      event_loop.state = .Start
      event = core.RedrawEventsCleared {}
      return
    case .LoopDestroyed:
      event = core.LoopDestroyed {}
      return
  }
  return
}

init_shared :: proc() -> ^SharedState {
  shared := new(SharedState)
  shared.windowHandleToId = make(map[glfw.WindowHandle]WindowId)
  shared.windows = make(map[WindowId]^Window)
  queue.init(&shared.event_queue)
  queue.init(&shared.redraw_queue)
  return shared
}

deinit_shared :: proc(shared: ^SharedState) {
  for id, window in shared.windows {
    deinit_window(window)
  }
  delete(shared.windows)
  delete(shared.windowHandleToId)
  queue.destroy(&shared.event_queue)
  queue.destroy(&shared.redraw_queue)
  free(shared)
}

init_event_loop :: proc() -> ^EventLoop {
  glfw.Init()
  event_loop := new(EventLoop)
  event_loop.shared = init_shared()
  event_loop.target = EventLoopWindowTarget { shared = event_loop.shared }
  event_loop.flow = core.Poll{}
  event_loop.state = .Start
  return event_loop
}

deinit_event_loop :: proc(event_loop: ^EventLoop) {
  deinit_shared(event_loop.shared)
  free(event_loop)
  glfw.Terminate()
}

// locks the thread, sends an event and unlucks
send_event :: proc(shared: ^SharedState, event: core.Event) {
  sync.lock(&shared.event_lock)
  queue.push(&shared.event_queue, event)
  sync.unlock(&shared.event_lock)
}

send_redraw :: proc(shared: ^SharedState, id: WindowId) {
  sync.lock(&shared.redraw_lock)
  queue.push(&shared.redraw_queue, id)
  sync.unlock(&shared.redraw_lock)
}