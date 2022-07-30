package window_example

import "core:fmt"
import "core:mem"

import w "../acute/window"

start :: proc () {
  event_loop := w.new_event_loop();
  window := w.new_window(event_loop, w.default_window_settings());

  for !w.exit(event_loop) {
    event, flow, target, status := w.poll_event(event_loop)
    if status != .Ok { continue }
    #partial switch e in event {
      case w.InputEvent:
        #partial switch input in e.input {
          case w.InputKey:
            if input.key == .KeyEscape && input.state == .Pressed && e.id == window.id {
              flow^ = w.Exit{}
            }
            if input.key == .KeyR && input.state == .Pressed && e.id == window.id {
              w.request_redraw(window)
            }
            fmt.println("key: ", input.key)
        }
      case w.RedrawRquested:
        fmt.println("redraw requested", e)
      case w.LoopDestroyed:
        fmt.println("loop destroyed", e)
    }
  }
}

main :: proc() {
  track: mem.Tracking_Allocator
  mem.tracking_allocator_init(&track, context.allocator)
  defer mem.tracking_allocator(&track)
  context.allocator = mem.tracking_allocator(&track)

  defer for _, v in track.allocation_map {
    fmt.println()
    fmt.eprintf("%v Leaked %v bytes.", v.location, v.size)
    fmt.println()
  }
 
  defer for v in track.bad_free_array {
    fmt.println()
    fmt.eprintf("%v Bad free.", v.location)
    fmt.println()
  }
  
  start()
}