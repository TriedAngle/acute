package vulkanite

import vk "vendor:vulkan"

Settings :: struct {
  app_name: string,
  app_version: u32,
  engine_name: string,
  engine_version: u32,
  layers: Layers,
  // features: Features,
  extensions: ^Extensions,
  debug: VkDebugProc,
  load_proc: rawptr,
}

default_settings :: proc (
  app_name := "acute",
  app_version: u32 = 4096, // vk.MAKE_VERSION(0, 1, 0,)
  engine_name := "acute",
  engine_version: u32 = 4096, // vk.MAKE_VERSION(0, 1, 0)
  layers: Layers = { .Validation },
  // features :=
  extensions: ^Extensions,
  debug := default_vulkan_debug_callback,
  load_proc: rawptr,
) -> Settings {
  return Settings {
    app_name = app_name,
    app_version = app_version,
    engine_name = engine_name,
    engine_version = engine_version,
    layers = layers,
    extensions = extensions,
    debug = debug,
    load_proc = load_proc,
  }
}



// Features :: vk.PhysicalDeviceFeatures

Layers :: distinct bit_set[Layer]

Extensions :: [dynamic]Extension

Layer :: enum {
  Validation,
} 

layer_to_raw := map[Layer]cstring {
  .Validation = "VK_LAYER_KHRONOS_validation",
}