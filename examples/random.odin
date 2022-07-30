package random

import "core:fmt"

PrintProc :: #type proc(x: int)

TestStruct :: struct {
  cb: Maybe(PrintProc),
}

default_print_cb :: proc (x: int) {
  fmt.println("hello", x)
}

default_test_struct :: proc (
  cb := default_print_cb,
) -> TestStruct {
  return TestStruct {
    cb = cb,
  }
}

main :: proc() {
  test := default_test_struct()
}