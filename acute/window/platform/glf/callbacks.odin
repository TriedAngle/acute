package glf

import "core:fmt"
import "core:runtime"
import "vendor:glfw"
import "../../core"

windowCloseRequestedCallback :: proc "cdecl" (window: glfw.WindowHandle) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowCloseRequested { },
  }

  send_event(shared, event)
}

windowMovedCallback :: proc "cdecl" (window: glfw.WindowHandle, width, height: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowMoved { 
      x = width,
      y = height,
    },
  }

  send_event(shared, event)
}

windowResizedCallback :: proc "cdecl" (window: glfw.WindowHandle, width, height: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowResized { 
      width = width,
      height = height,
    },
  }

  send_event(shared, event)
}

windowScaleChangedCallback :: proc "cdecl" (window: glfw.WindowHandle, xscale, yscale: f32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowScaleChanged { 
      x = xscale,
      y = yscale,
    },
  }


  send_event(shared, event)
}

windowMaximizedCallback :: proc "cdecl" (window: glfw.WindowHandle, maximized: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowMaximized { 
      maximized = maximized == 1,
    },
  }

  send_event(shared, event)
}

windowFocusedCallback :: proc "cdecl" (window: glfw.WindowHandle, focused: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.WindowEvent {
    id = id,
    action = core.WindowFocused { 
      focused = focused == 1,
    },
  }

  send_event(shared, event)
}


keyCallback :: proc "cdecl" (window: glfw.WindowHandle, key, scancode, action, mods: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  key := glfw_to_key[key]
  state := glfw_to_state[action]
  mods := glfw_to_bitset(mods)

  event := core.InputEvent {
    id = id,
    input = core.InputKey {
      key = key,
      state = state,
      mods = mods,
    },
  }
  send_event(shared, event)
}

runeCallback :: proc "cdecl" (window: glfw.WindowHandle, codepoint: rune, mods: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  mods := glfw_to_bitset(mods)
  event := core.InputEvent {
    id = id,
    input = core.InputRune {
      val = codepoint,
      mods = mods,
    },
  }
  send_event(shared, event)
}

mouseMoveCallback :: proc "cdecl" (window: glfw.WindowHandle, xpos, ypos: f64) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.InputEvent {
    id = id,
    input = core.InputMouseMove {
      x = xpos, 
      y = ypos,
    },
  }
  send_event(shared, event)
}

mouseEnterCallback :: proc "cdecl" (window: glfw.WindowHandle, enter: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  enter := enter == 1
  event := core.InputEvent {
    id = id,
    input = core.InputMouseEnter {
      enter = enter,
    },
  }
  send_event(shared, event)
}

mouseButtonCallback :: proc "cdecl" (window: glfw.WindowHandle, button, action, mods: i32) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  state := glfw_to_state[action]
  kind: core.MouseButtonKind 
  if button == 0 {
    kind = .Left
  } else if button == 1 {
    kind = .Right
  } else if button == 2 {
    kind = .Middle
  } else {
    kind = .Other
  }

  event := core.InputEvent {
    id = id,
    input = core.InputMouseButton {
      button = core.MouseButton {
        button = kind,
        raw = button,
      },
      state = state,
    },
  }
  send_event(shared, event)
}

mouseScrollCallback :: proc "cdecl" (window: glfw.WindowHandle, xpos, ypos: f64) {
  context = runtime.default_context()
  shared := cast(^SharedState) glfw.GetWindowUserPointer(window)
  id := shared.windowHandleToId[window]

  event := core.InputEvent {
    id = id,
    input = core.InputMouseScroll {
      x = xpos, 
      y = ypos,
    },
  }
  send_event(shared, event)
}
