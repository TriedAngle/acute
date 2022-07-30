package trace

import "core:fmt"

Level :: enum {
  Debug,
  Info,
  Warn,
  Error,
}

// TODO: Logic other than plain printing
event :: proc(level: Level, args: ..any) {
  fmt.println(level, args)
}