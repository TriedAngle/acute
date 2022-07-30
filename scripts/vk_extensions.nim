import httpclient, strutils, tables, strformat

const extensions = "https://vulkan.gpuinfo.org/listextensions.php"

var client = newHttpClient()

var content = client.getContent(extensions)

let start = content.find("<table")
let stop = content.find("</table>")
content = content[start..<stop]

let rows = content.split("<tr>")

var table = newTable[string, string]()

for row in rows:
  let start = row.find("<td>")
  let stop = row.find("</td>")
  var extension = row[start..<stop]
  if extension.len == 0: continue
  extension = extension[7..<extension.len]
  let extensionRaw = extension
  while extension.find('_') != -1:
    let idx = extension.find('_')
    extension[idx + 1] = extension[idx + 1].toUpperAscii
    extension.delete(idx..idx)

  if extension[3].isDigit():
    if extension.startsWith("EXT"): extension = extension.replace("EXT", "EXT_")
    if extension.startsWith("KHR"): extension = extension.replace("KHR", "KHR_")
  else:
    if extension.startsWith("EXT"): extension = extension.replace("EXT", "")
    if extension.startsWith("KHR"): extension = extension.replace("KHR", "")
  if extension.startsWith("NV"): extension = extension.replace("NV", "NV_")
  if extension.startsWith("QCOM"): extension = extension.replace("QCOM", "QCOM_")
  if extension.startsWith("VALVE"): extension = extension.replace("VALVE", "VALVE_")
  if extension.startsWith("AMD"): extension = extension.replace("AMD", "AMD_")
  if extension.startsWith("MESA"): extension = extension.replace("MESA", "MESA_")
  if extension.startsWith("GOOGLE"): extension = extension.replace("GOOGLE", "GOOGLE_")
  if extension.startsWith("KHX"): extension = extension.replace("KHX", "KHX_")

  table[extension] = extensionRaw

table["XcbSurface"] = "KHR_xcb_surface"
table["Invalid"] = "Invalid"

let ok = '\"'

var output: string
output.add "package vulkanite \n\n"
output.add "import vk \"vendor:vulkan\"\n\n"
output.add "Extension :: enum {\n"
for extension, raw in table.pairs:
  output.add fmt"  {extension}, // VK_{raw}{'\n'}"
output.add "}\n"

output.add "extension_to_raw :: proc(e: Extension) -> cstring {\n"
output.add "  switch e {\n"
for extension, raw in table.pairs:
  output.add fmt"    case .{extension}: return {ok}VK_{raw}{ok}{'\n'}"
output.add "  }\n"
output.add "  return \"Invalid\"\n"
output.add "}\n"


output.add "raw_to_extension :: proc(raw: cstring) -> Extension {\n"
output.add "  switch raw {\n"
for extension, raw in table.pairs:
  output.add fmt"    case {ok}VK_{raw}{ok}: return .{extension}{'\n'}"
output.add "  }\n"
output.add "  return .Invalid \n"
output.add "}\n"

writeFile("acute/vulkanite/generated_types.odin", output)