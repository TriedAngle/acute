package window

import "core"

deinit :: proc {
  deinit_event_loop,
}

WindowId :: core.WindowId
WindowSettings :: core.WindowSettings

default_window_settings :: core.default_window_settings

ControlFlow :: core.ControlFlow
Poll :: core.Poll
Wait :: core.Wait
WaitUntil :: core.WaitUntil
Exit :: core.Exit
ExitWithCode :: core.ExitWithCode

Status :: core.Status

Event :: core.Event

MainEventsCleared :: core.MainEventsCleared
RedrawRquested :: core.RedrawRquested
RedrawEventsCleared :: core.RedrawEventsCleared
LoopDestroyed :: core.LoopDestroyed

WindowEvent :: core.WindowEvent

WindowDestroyed :: core.WindowDestroyed
WindowCloseRequested :: core.WindowCloseRequested
WindowResized :: core.WindowResized
WindowScaleChanged :: core.WindowScaleChanged
WindowMoved :: core.WindowMoved
WindowMaximized :: core.WindowMaximized
WindowFocused :: core.WindowFocused

InputEvent :: core.InputEvent

InputKey :: core.InputKey
InputRune :: core.InputRune

InputMouseMove   :: core.InputMouseMove  
InputMouseEnter  :: core.InputMouseEnter 
InputMouseButton :: core.InputMouseButton
InputMouseScroll :: core.InputMouseScroll

InputFileDrop :: core.InputFileDrop

