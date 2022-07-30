package platform
import "core:fmt"

when #config(window, "none") == "glfw" {
  import impl "glf"
} else when ODIN_OS == .Windows {
  import impl "windows"
} else {
  import impl "linux"
}

EventLoop :: impl.EventLoop
EventLoopWindowTarget :: impl.EventLoopWindowTarget
EventLoopProc :: impl.EventLoopProc
Window :: impl.Window

poll_event :: impl.poll_event
exit :: impl.exit
request_redraw :: impl.request_redraw

init_event_loop :: impl.init_event_loop
init_window :: impl.init_window

deinit_event_loop :: impl.deinit_event_loop
deinit_window :: impl.deinit_window

window_id :: impl.window_id

raw_window_handle :: impl.raw_window_handle
vulkan_load_proc :: impl.vulkan_load_proc
vulkan_surface_proc :: impl.vulkan_surface_proc
required_vulkan_extensions :: impl.required_vulkan_extensions