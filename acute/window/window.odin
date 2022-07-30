package window

import "platform"

Window :: struct {
  id: WindowId,
  impl: ^platform.Window,
}

raw_window_handle :: proc(window: Window) -> rawptr {
  return platform.raw_window_handle(window.impl)
}

vulkan_load_proc :: proc(window: Window) -> rawptr {
  return platform.vulkan_load_proc(window.impl)
}

vulkan_surface_proc :: proc(window: Window) -> rawptr {
  return platform.vulkan_surface_proc(window.impl)
}

new_window :: proc(event_loop: EventLoop, settings: WindowSettings) -> Window {
  impl := platform.init_window(event_loop.impl, settings)
  return Window {
    id = platform.window_id(impl),
    impl = impl,
  }
}

request_redraw :: proc(window: Window) {
  platform.request_redraw(window.impl)
}

required_vulkan_extensions :: proc(window: Window) -> []cstring {
  return platform.required_vulkan_extensions(window.impl)
}