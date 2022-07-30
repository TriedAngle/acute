package vulkanite

import "core:fmt"

import vk "vendor:vulkan"

Adapter :: struct {
  handle: vk.PhysicalDevice,
  instance: VkInstance,
  properties: vk.PhysicalDeviceProperties,
  features: vk.PhysicalDeviceFeatures,
  queue_families: [dynamic]vk.QueueFamilyProperties,
}

init_adapters :: proc(instance: ^Instance) -> (adapters: [dynamic]Adapter, err: Error) {
  i_handle := instance.shared.handle
  physical_device_count : u32
  vk.EnumeratePhysicalDevices(i_handle, &physical_device_count, nil)
  if physical_device_count == 0 {
    fmt.eprintln("no physical device with vulkan support detected")
    err = VulkaniteError { }
    return
  }
  physical_devices := make([]vk.PhysicalDevice, physical_device_count); defer delete(physical_devices)
  adapters = make([dynamic]Adapter, physical_device_count)
  vk.EnumeratePhysicalDevices(i_handle, &physical_device_count, raw_data(physical_devices))

  for pd in &physical_devices {
    
  }
  return
}