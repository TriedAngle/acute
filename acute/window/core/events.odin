package core

Event :: union {
  WindowEvent,
  InputEvent,
  EventsStart,
  MainEventsCleared,
  RedrawRquested,
  RedrawEventsCleared,
  LoopDestroyed,
}

EventsStart :: struct {}
MainEventsCleared :: struct {}
RedrawRquested :: struct {
  id: WindowId,
}
RedrawEventsCleared :: struct {}
LoopDestroyed :: struct {}


WindowEvent :: struct {
  id: WindowId,
  action: union {
    WindowDestroyed,
    WindowCloseRequested,
    WindowResized,
    WindowScaleChanged,
    WindowMoved,
    WindowMaximized,
    WindowFocused,
  },
}

WindowDestroyed :: struct {}
WindowCloseRequested :: struct {}
WindowResized :: struct {
  width, height: i32,
}

WindowScaleChanged :: struct {
  x, y: f32,
}

WindowMoved :: struct {
  x, y: i32,
}

WindowMaximized :: struct {
  maximized: bool,
}

WindowFocused :: struct {
  focused: bool,
}

InputEvent :: struct {
  id: WindowId,
  input: union {
    InputKey,
    InputRune,
    InputMouseMove,
    InputMouseEnter,
    InputMouseButton,
    InputMouseScroll,
    InputFileDrop,
  },
}

InputKey :: struct {
  key: Key,
  state: InputState,
  mods: Modifiers,
}
InputRune :: struct {
  val: rune,
  mods: Modifiers,
}

InputMouseMove :: struct {
  x, y: f64,
}
InputMouseEnter :: struct {
  enter: bool,
}
InputMouseButton :: struct {
  button: MouseButton,
  state: InputState,
}

InputMouseScroll :: struct {
  x, y: f64,
}

InputFileDrop :: struct {}
