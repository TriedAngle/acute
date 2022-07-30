package core

WindowSettings :: struct {
  width, height: i32,
  title: string,
  resizable, visible, decorated, focused, auto_iconify, floating, maximized,
  center_cursor, transparent, focus_on_show, scale_to_monitor, mouse_passthrough, srgb_capable: bool,
  refresh_rate: i32,
}

default_window_settings :: proc(
  width: i32 = 1280,
  height: i32 = 720,
  title: string = "Acute",
  resizable: bool = false,
  visible: bool = true,
  decorated: bool = true,
  focused: bool = true,
  auto_iconify: bool = true,
  floating: bool = false,
  maximized: bool = false,
  center_cursor: bool = false,
  transparent: bool = false,
  focus_on_show: bool = true,
  scale_to_monitor: bool = false,
  mouse_passthrough: bool = false,
  stereo: bool = false,
  srgb_capable: bool = false,
  refresh_rate: i32 = -1,
) -> WindowSettings {
  return WindowSettings {
    width = width,
    height = height,
    title = title,
    resizable = resizable,
    visible = visible,
    decorated = decorated,
    focused = focused,
    auto_iconify = auto_iconify,
    floating = floating,
    maximized = maximized,
    center_cursor = center_cursor,
    transparent = transparent,
    focus_on_show = focus_on_show,
    scale_to_monitor = scale_to_monitor,
    mouse_passthrough = mouse_passthrough,
    srgb_capable = srgb_capable,
    refresh_rate = refresh_rate,
  }
}