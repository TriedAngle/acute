package vulkan_example

import "core:fmt"
import "core:mem"

import w "../acute/window"
import v "../acute/vulkanite"

start :: proc () {
  event_loop := w.new_event_loop();
  window := w.new_window(event_loop, w.default_window_settings());
  
  window_handle := window.impl.handle
  vulkan_load_proc := w.vulkan_load_proc(window)
  vulkan_surface_proc := w.vulkan_surface_proc(window)
  raw_window_handle := w.raw_window_handle(window)

  extensions_raw := w.required_vulkan_extensions(window)
  extensions := make([dynamic]v.Extension);

  device_extensions := v.Extensions { .Swapchain, .DynamicRendering }

  for raw in extensions_raw {
    append(&extensions, v.raw_to_extension(raw))
  }

  settings := v.default_settings(
    extensions = &extensions,
    load_proc=vulkan_load_proc,
  )

  instance, err_instance := v.init_instance(settings); defer v.deinit_instance(&instance)
  if err_instance != nil {
    fmt.eprintln(err_instance)
  }

  surface, err_surface := v.init_surface(&instance, window_handle, vulkan_surface_proc); defer v.deinit_surface(&surface)
  if err_surface != nil {
    fmt.eprintln(err_surface)
  }

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
            fmt.println("key: ", input)
        }
      case w.MainEventsCleared:
        w.request_redraw(window)
      case w.RedrawRquested:

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