package glf

import "core:fmt"
import "core:c"
import "core:strings"
import "vendor:glfw"

import "../../core"

Window :: struct {
  id: WindowId,
  handle: glfw.WindowHandle,
  settings: WindowSettings,
  shared: ^SharedState,
}

WindowSettings :: struct {
  using settings: core.WindowSettings,
  ctitle: cstring,
}

init_window :: proc(event_loop: ^EventLoop, settings: core.WindowSettings) -> ^Window {
  shared := event_loop.shared
  
  title := strings.clone_to_cstring(settings.title)
  b2int :: proc(b: bool) -> c.int { if b { return 1 } else { return 0 }}

  glfw.WindowHint(glfw.CLIENT_API, glfw.NO_API);
  glfw.WindowHint(glfw.RESIZABLE, b2int(settings.resizable))
  glfw.WindowHint(glfw.VISIBLE, b2int(settings.visible))
  glfw.WindowHint(glfw.DECORATED, b2int(settings.decorated))
  glfw.WindowHint(glfw.FOCUSED, b2int(settings.focused))
  glfw.WindowHint(glfw.AUTO_ICONIFY, b2int(settings.auto_iconify))
  glfw.WindowHint(glfw.FLOATING, b2int(settings.floating))
  glfw.WindowHint(glfw.MAXIMIZED, b2int(settings.maximized))
  glfw.WindowHint(glfw.CENTER_CURSOR, b2int(settings.center_cursor))
  glfw.WindowHint(glfw.TRANSPARENT_FRAMEBUFFER, b2int(settings.transparent))
  glfw.WindowHint(glfw.FOCUS_ON_SHOW, b2int(settings.focus_on_show))
  glfw.WindowHint(glfw.SCALE_TO_MONITOR, b2int(settings.scale_to_monitor))
  glfw.WindowHint(0x0002000D, b2int(settings.mouse_passthrough)) // mouse passthrough
  glfw.WindowHint(glfw.SRGB_CAPABLE, b2int(settings.srgb_capable))
  glfw.WindowHint(glfw.REFRESH_RATE, settings.refresh_rate)

  handle := glfw.CreateWindow(settings.width, settings.height, title, nil, nil)

  id := cast(WindowId)shared.nextId
  shared.nextId += 1
  shared.windowHandleToId[handle] = id

  glfw.MakeContextCurrent(handle)
  glfw.SetWindowUserPointer(handle, cast(rawptr)shared)

  glfw.SetWindowCloseCallback(handle, windowCloseRequestedCallback)
  glfw.SetWindowPosCallback(handle, windowMovedCallback)
  glfw.SetWindowSizeCallback(handle, windowResizedCallback)
  glfw.SetWindowContentScaleCallback(handle, windowScaleChangedCallback)
  glfw.SetWindowMaximizeCallback(handle, windowMaximizedCallback)
  glfw.SetWindowFocusCallback(handle, windowFocusedCallback)


  glfw.SetKeyCallback(handle, keyCallback)
  glfw.SetCharModsCallback(handle, runeCallback)
  glfw.SetCursorPosCallback(handle, mouseMoveCallback)
  glfw.SetCursorEnterCallback(handle, mouseEnterCallback)
  glfw.SetMouseButtonCallback(handle, mouseButtonCallback)
  glfw.SetScrollCallback(handle, mouseScrollCallback)

  window := new(Window)
  shared.windows[id] = window

  window.id = id
  window.handle = handle
  window.settings = WindowSettings {
    settings = settings,
    ctitle = title,
  }

  window.shared = shared
  return window
}

deinit_window :: proc(window: ^Window) {
  shared := window.shared
  delete(window.settings.ctitle)

  delete_key(&shared.windowHandleToId, window.handle)
  glfw.DestroyWindow(window.handle)
  free(window)
}

window_id :: proc(window: ^Window) -> WindowId {
  return window.id
}

hello :: proc() {
  fmt.println("hello from GLFW")
}

request_redraw :: proc(window: ^Window) {
  send_redraw(window.shared, window.id)
}

raw_window_handle :: proc(window: ^Window) -> rawptr {
  return cast(rawptr) window.handle
}

vulkan_load_proc :: proc(window: ^Window) -> rawptr {
  return cast(rawptr) glfw.GetInstanceProcAddress
}

vulkan_surface_proc :: proc(window: ^Window) -> rawptr {
  return cast(rawptr) glfw.CreateWindowSurface
}

required_vulkan_extensions :: proc(window: ^Window) -> []cstring {
  return glfw.GetRequiredInstanceExtensions()
}