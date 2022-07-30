package window

import "platform"
import "core"

EventLoop :: struct {
  impl: ^platform.EventLoop,
}

EventLoopWindowTarget :: platform.EventLoopWindowTarget

poll_event :: proc(event_loop: EventLoop) -> (Event, ^ControlFlow, ^EventLoopWindowTarget, Status) {
  return platform.poll_event(event_loop.impl)
}

exit :: proc(event_loop: EventLoop) -> bool {
  return platform.exit(event_loop.impl)
}

new_event_loop :: proc() -> EventLoop {
  return EventLoop {
    impl = platform.init_event_loop(),
  }
}

@(private)
deinit_event_loop :: proc(event_loop: EventLoop) {
  platform.deinit_event_loop(event_loop.impl)
}