package core

ControlFlow :: union {
  Poll,
  Wait,
  WaitUntil,
  Exit,
  ExitWithCode,
}

Poll :: struct {}
Wait :: struct {}
WaitUntil :: struct {}
Exit :: struct {}
ExitWithCode :: struct {
  code: int,
}

Status :: enum {
  Nothing,
  Ok,
  Exit,
}