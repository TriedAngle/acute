package glf

import "vendor:glfw"
import "../../core"

glfw_to_key := map[i32]core.Key {
  -1  = .KeyUnknown,
  32  = .KeySpace,
  39  = .KeyApostrophe,
  44  = .KeyComma,
  45  = .KeyMinus,
  46  = .KeyPeriod,
  47  = .KeySlash,
  
  48  = .Key0,
  49  = .Key1,
  50  = .Key2,
  51  = .Key3,
  52  = .Key4,
  53  = .Key5,
  54  = .Key6,
  56  = .Key7,
  57  = .Key8,
  58  = .Key9,

  59  = .KeySemicolon,
  61  = .KeyEqual,

  65  = .KeyA,
  66  = .KeyB,
  67  = .KeyC,
  68  = .KeyD,
  69  = .KeyE,
  70  = .KeyF,
  71  = .KeyG,
  72  = .KeyH,
  73  = .KeyI,
  74  = .KeyJ,
  75  = .KeyK,
  76  = .KeyL,
  77  = .KeyM,
  78  = .KeyN,
  79  = .KeyO,
  80  = .KeyP,
  81  = .KeyQ,
  82  = .KeyR,
  83  = .KeyS,
  84  = .KeyT,
  85  = .KeyU,
  86  = .KeyV,
  87  = .KeyW,
  88  = .KeyX,
  89  = .KeyY,
  90  = .KeyZ,

  91  = .KeyLeftBracket,
  92  = .KeyBackslash,
  93  = .KeyRightBracket,
  96  = .KeyGraveAccent,

  161 = .KeyWorld1,
  162 = .KeyWorld2,
  256 = .KeyEscape,
  257 = .KeyEnter,
  258 = .KeyTab,
  259 = .KeyBackspace,
  260 = .KeyInsert,
  261 = .KeyDelete,
  262 = .KeyRight,
  263 = .KeyLeft,
  264 = .KeyDown,
  265 = .KeyUp,
  266 = .KeyPageUp,
  267 = .KeyPageDown,
  268 = .KeyHome,
  269 = .KeyEnd,
  280 = .KeyCapsLock,
  281 = .KeyScrollLock,
  282 = .KeyNumLock,
  283 = .KeyPrintScreen,
  284 = .KeyPause,

  290 = .KeyF1,
  291 = .KeyF2,
  292 = .KeyF3,
  293 = .KeyF4,
  294 = .KeyF5,
  295 = .KeyF6,
  296 = .KeyF7,
  297 = .KeyF8,
  298 = .KeyF9,
  299 = .KeyF10,
  300 = .KeyF11,
  301 = .KeyF12,
  302 = .KeyF13,
  303 = .KeyF14,
  304 = .KeyF15,
  305 = .KeyF16,
  306 = .KeyF17,
  307 = .KeyF18,
  308 = .KeyF19,
  309 = .KeyF20,
  310 = .KeyF21,
  311 = .KeyF22,
  312 = .KeyF23,
  313 = .KeyF24,
  314 = .KeyF25,
  320 = .KeyKp0,
  321 = .KeyKp1,
  322 = .KeyKp2,
  323 = .KeyKp3,
  324 = .KeyKp4,
  325 = .KeyKp5,
  326 = .KeyKp6,
  327 = .KeyKp7,
  328 = .KeyKp8,
  329 = .KeyKp9,

  330 = .KeyKpDecimal,
  331 = .KeyKpDivide,
  332 = .KeyKpMultiply,
  333 = .KeyKpSubtract,
  334 = .KeyKpAdd,
  335 = .KeyKpEnter,
  336 = .KeyKpEqual,
  340 = .KeyLeftShift,
  341 = .KeyLeftControl,
  342 = .KeyLeftAlt,
  343 = .KeyLeftSuper,
  344 = .KeyRightShift,
  345 = .KeyRightControl,
  346 = .KeyRightAlt,
  347 = .KeyRightSuper,
  348 = .KeyMenu,
}

glfw_to_state := map[i32]core.InputState {
  0 = .Pressed,
  1 = .Released,
  2 = .Repeated,
}

glfw_to_bitset :: proc(bitfield: i32) -> core.Modifiers {
  bs : core.Modifiers

  if glfw.MOD_SHIFT & bitfield != 0 do bs |= { .Shift }
  if glfw.MOD_CONTROL & bitfield != 0 do bs |= { .Control }
  if glfw.MOD_ALT & bitfield != 0 do bs |= { .Alt }
  if glfw.MOD_SUPER & bitfield != 0 do bs |= { .Super }
  if glfw.MOD_CAPS_LOCK & bitfield != 0 do bs |= { .Caps }
  if glfw.MOD_NUM_LOCK & bitfield != 0 do bs |= { .NumLock }

  return bs
}