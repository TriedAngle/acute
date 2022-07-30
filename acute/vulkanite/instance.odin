package vulkanite

import "core:fmt"
import "core:runtime"

import vk "vendor:vulkan"
import "../trace"

Instance :: struct {
  shared: ^VkInstance,
}

VkInstance :: struct {
  handle: vk.Instance,
  settings: Settings,
  debug: ^VkDebug, // can be nil
}

VkDebug :: struct {
  messenger: vk.DebugUtilsMessengerEXT,
}

VkDebugProc :: vk.ProcDebugUtilsMessengerCallbackEXT

init_instance :: proc(settings: Settings) -> (instance: Instance, err: Error) {
  instance_handle : vk.Instance
  required_extensions : [dynamic]cstring; defer delete(required_extensions)
  required_layers : [dynamic]cstring; defer delete(required_layers)

  extensions := settings.extensions

  vk.load_proc_addresses(settings.load_proc)

  for extension in extensions {
    append(&required_extensions, extension_to_raw(extension))
  }

  if .Validation in settings.layers {
    append(&required_layers, layer_to_raw[.Validation])
  }

  supported_extensions := [dynamic]vk.ExtensionProperties{}; defer delete(supported_extensions)
  {
    extension_count : u32
    vk.EnumerateInstanceExtensionProperties(nil, &extension_count, nil)
    resize(&supported_extensions, int(extension_count))
    vk.EnumerateInstanceExtensionProperties(nil, &extension_count, raw_data(supported_extensions))
  }

  supported_layers := [dynamic]vk.LayerProperties{}; defer delete(supported_layers)
  {
    layer_count : u32
    vk.EnumerateInstanceLayerProperties(&layer_count, nil)
    resize(&supported_layers, int(layer_count))
    vk.EnumerateInstanceLayerProperties(&layer_count, raw_data(supported_layers))
  }

  for required in required_extensions {
    contains := false
    for supported in &supported_extensions {
      name := transmute(cstring) &supported.extensionName
      if name == required {
        contains = true
        break
      }
    }
    if !contains {
      err = VulkaniteError { message = "Rquired Extension not supported"}
      fmt.eprintln("extension", required, "is not in extensions list")
      return
    }
  }

  for required in required_layers {
    contains := false
    for supported in &supported_layers {
      name := transmute(cstring) &supported.layerName
      if name == required {
        contains = true
        break
      }
    }
    if !contains {
      err = VulkaniteError { message = "Rquired Layer not supported"}
      fmt.eprintln("layer", required, "is not in extensions list")
      return
    }
  }

  vk_instance := new(VkInstance)
  vk_instance.settings = settings
  vk_instance.handle = instance_handle
  instance.shared = vk_instance

  instance_info := vk.InstanceCreateInfo {
    sType = .INSTANCE_CREATE_INFO,
    enabledExtensionCount = u32(len(required_extensions)),
    ppEnabledExtensionNames = raw_data(required_extensions),
    enabledLayerCount = u32(len(required_layers)),
    ppEnabledLayerNames = raw_data(required_layers),
  }

  if settings.debug != nil {
    default_debug_utils_messenger := vk.DebugUtilsMessengerCreateInfoEXT {
      sType = .DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT,
      messageSeverity = { .INFO, .WARNING, .ERROR },
      messageType = { .VALIDATION, .PERFORMANCE },
      pfnUserCallback = settings.debug,
    }
    instance_info.pNext = &default_debug_utils_messenger
  }

  result := vk.CreateInstance(&instance_info, nil, &vk_instance.handle)

  if result != .SUCCESS {
    err = VulkaniteError { message = "failed to create vulkan instance"}
    fmt.eprintln("failed to create vulkan instance")
    return
  }

  trace.event(.Info, "Instance Extensions:", required_extensions)
  trace.event(.Info, "Instance Layers:", required_layers)
  vk.load_proc_addresses(vk_instance.handle)
  fmt.println("HANDLE: ", instance.shared.handle)
  return
}

deinit_instance :: proc(instance: ^Instance) {
  settings := instance.shared.settings
  if instance.shared.debug != nil {
    free(instance.shared.debug)
  }
  delete(settings.extensions^)
  free(instance.shared)
}


default_vulkan_debug_callback :: proc "system" (
  messageSeverity: vk.DebugUtilsMessageSeverityFlagsEXT,
  messageTypes: vk.DebugUtilsMessageTypeFlagsEXT,
  pCallbackData: ^vk.DebugUtilsMessengerCallbackDataEXT,
  pUserData: rawptr,
) -> b32 {
  context = runtime.default_context()
  data := pCallbackData^
  id := data.messageIdNumber
  severity := messageSeverity
  types := messageTypes
  message_id_name := data.pMessageIdName if data.pMessageIdName != nil else ""
  message := data.pMessage if data.pMessage != nil else ""

  if .VERBOSE in severity {
    trace.event(.Debug, "VULKAN", types, message_id_name, id, message)
  }

  if .INFO in severity {
    trace.event(.Info, "VULKAN", types, message_id_name, id, message)
  }

  if .WARNING in severity {
    trace.event(.Warn, "VULKAN", types, message_id_name, id, message)
  }

  if .ERROR in severity {
    trace.event(.Error, "VULKAN", types, message_id_name, id, message)
  }

  return false
}
