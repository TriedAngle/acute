package vulkanite

import "core:fmt"

import vk "vendor:vulkan"

Surface :: struct {
  shared: ^VkSurface,
}

VkSurface :: struct {
  handle: vk.SurfaceKHR,
  instance: ^VkInstance,
}

SurfaceLoadProc :: #type proc(instance: vk.Instance, raw_window_handle: rawptr, allocator: ^vk.AllocationCallbacks, surface: ^vk.SurfaceKHR) -> vk.Result

init_surface :: proc(instance: ^Instance, raw_window_handle: rawptr, raw_loading_proc: rawptr) -> (surface: Surface, err: Error) {
  vk_surface := new(VkSurface)
  vk_surface.instance = instance.shared

  surface_proc := cast(SurfaceLoadProc) raw_loading_proc
  result := surface_proc(vk_surface.instance.handle, raw_window_handle, nil, &vk_surface.handle)
  
  if result != .SUCCESS {
    err = cast(VkError)result
    return
  }
  surface.shared = vk_surface
  return
}

deinit_surface :: proc(surface: ^Surface) {
  handle := surface.shared.handle
  instance := surface.shared.instance.handle
  vk.DestroySurfaceKHR(instance, handle, nil)
  free(surface.shared)
}