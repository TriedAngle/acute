package vulkanite

import vk "vendor:vulkan"

Error :: union {
  VulkaniteError,
  VkError,
}

VulkaniteError :: struct {
  message: string,
}

VkError :: distinct vk.Result
