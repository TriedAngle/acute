import os, osproc, strformat

const overrideGlfw = true
const overrideDebug = true

const examples = [
  "random",
  "window",
  "vulkan",
]

let params = commandLineParams()
var example = ""

if params.len() >= 2 and params[0] == "example":
  if params[1] in examples:
    example = params[1]
  else:
    quit(fmt"example: {params[1]} not in examples")

var command = if example == "":
  "odin run ."
else:
  fmt"odin run examples/{example}.odin -file"

if "no" not_in params:
  if overrideGlfw:
    command.add " -define:window=glfw"
  if overrideDebug:
    command.add " --debug"

if "glfw" in params: command.add " -define:window=glfw"
if "debug" in params: command.add " --debug"
if "release" in params: command.add " --release"

command.add " -out:build/" & (if example == "": "acute" else: example)

discard execCmd command