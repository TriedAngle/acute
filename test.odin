package main

import "core:fmt"
import "core:c"
import "core:mem"

import "core:runtime"
import "core:slice"

import vk "vendor:vulkan"
import glfw "vendor:glfw"
import glfw_bindings "vendor:glfw/bindings"

import "acute"

start :: proc() {
  glfw.Init(); defer glfw.Terminate()

  glfw.WindowHint(glfw.CLIENT_API, glfw.NO_API)
  glfw.WindowHint(glfw.RESIZABLE, 0)

  window := glfw.CreateWindow(1280, 720, "Vulkan Testing", nil, nil); defer glfw.DestroyWindow(window)
  if window == nil {
    fmt.eprintln("failed to create window")
    return
  }

  vk.load_proc_addresses(rawptr(glfw.GetInstanceProcAddress))

  default_debug_utils_messenger := vk.DebugUtilsMessengerCreateInfoEXT {
    sType = .DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT,
    messageSeverity = { .INFO, .WARNING, .ERROR },
    messageType = { .VALIDATION, .PERFORMANCE },
    pfnUserCallback = proc "system" (
      messageSeverity: vk.DebugUtilsMessageSeverityFlagsEXT,
      messageTypes: vk.DebugUtilsMessageTypeFlagsEXT,
      pCallbackData: ^vk.DebugUtilsMessengerCallbackDataEXT,
      pUserData: rawptr,
    ) -> b32 {
      context = runtime.default_context()
      fmt.eprintln("DebugUtilsMessenger:", pCallbackData.pMessage)
      return false
    },
  }

  instance : vk.Instance; defer vk.DestroyInstance(instance, nil)
  {
    required_extensions : [dynamic]cstring; defer delete(required_extensions)
    required_layers : [dynamic]cstring; defer delete(required_layers)

    {
      glfw_extensions := glfw.GetRequiredInstanceExtensions()
      append(&required_extensions, ..glfw_extensions)
    }

    when ODIN_DEBUG {
      append(&required_extensions, vk.EXT_DEBUG_REPORT_EXTENSION_NAME, vk.EXT_DEBUG_UTILS_EXTENSION_NAME)
      append(&required_layers, "VK_LAYER_KHRONOS_validation")
    }
    {
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
          fmt.eprintln("extension", required, "is not in extensions list")
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
          fmt.eprintln("layer", required, "is not in layers list")
        }
      }
    }

    instance_info := vk.InstanceCreateInfo {
      sType = .INSTANCE_CREATE_INFO,
      enabledExtensionCount = u32(len(required_extensions)),
      ppEnabledExtensionNames = raw_data(required_extensions),
      enabledLayerCount = u32(len(required_layers)),
      ppEnabledLayerNames = raw_data(required_layers),
    }

    when ODIN_DEBUG {
      instance_info.pNext = &default_debug_utils_messenger
    }

    fmt.println("Extensions:", required_extensions)
    fmt.println("Layers:", required_layers)

    if vk.CreateInstance(&instance_info, nil, &instance) != .SUCCESS {
      fmt.eprintln("failed to create vulkan instance")
      return
    }
  }

  vk.load_proc_addresses(instance)

  when ODIN_DEBUG {
    debug_utils_messenger : vk.DebugUtilsMessengerEXT; defer vk.DestroyDebugUtilsMessengerEXT(instance, debug_utils_messenger, nil)
    debug_report_callback : vk.DebugReportCallbackEXT; defer vk.DestroyDebugReportCallbackEXT(instance, debug_report_callback, nil)
    {
      debug_utils_messenger_info := default_debug_utils_messenger
      vk.CreateDebugUtilsMessengerEXT(instance, &debug_utils_messenger_info, nil, &debug_utils_messenger)

      debug_report_info := vk.DebugReportCallbackCreateInfoEXT {
        sType = .DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
        flags = { .ERROR, .PERFORMANCE_WARNING, .WARNING },
        pfnCallback = proc "system" (
          flags: vk.DebugReportFlagsEXT,
          objectType: vk.DebugReportObjectTypeEXT,
          object: u64,
          location: int,
          messageCode: i32,
          pLayerPrefix: cstring,
          pMessage: cstring,
          pUserData: rawptr,
        ) -> b32 {
          context = runtime.default_context()
          fmt.eprintln("DebugReportCallback:", pMessage)
          return false
        },
      }
      vk.CreateDebugReportCallbackEXT(instance, &debug_report_info, nil, &debug_report_callback)
    }
  }

  surface : vk.SurfaceKHR; defer vk.DestroySurfaceKHR(instance, surface, nil)
  if glfw.CreateWindowSurface(instance, window, nil, &surface) != .SUCCESS {
    fmt.eprintln("glfw coudn't create vulkan surface")
    return
  }

  physical_device : vk.PhysicalDevice
  device_capabilities : vk.SurfaceCapabilitiesKHR
  device_formats : []vk.SurfaceFormatKHR; defer delete(device_formats)
  device_present_modes : []vk.PresentModeKHR; defer delete(device_present_modes)

  queue_family_graphics_index := -1
  queue_family_present_index := -1
  device_extensions := []cstring{"VK_KHR_swapchain"}

  {
    physical_device_count : u32
    vk.EnumeratePhysicalDevices(instance, &physical_device_count, nil)
    if physical_device_count == 0 {
      fmt.eprintln("no physical device with vulkan support detected")
      return
    }

    physical_devices := make([]vk.PhysicalDevice, physical_device_count); defer delete(physical_devices)
    vk.EnumeratePhysicalDevices(instance, &physical_device_count, raw_data(physical_devices))
    for pd in &physical_devices {
      extension_count : u32
      vk.EnumerateDeviceExtensionProperties(pd, nil, &extension_count, nil)
      extensions := make([]vk.ExtensionProperties, int(extension_count)); defer delete(extensions)
      vk.EnumerateDeviceExtensionProperties(pd, nil, &extension_count, raw_data(extensions))

      required_extensions := true
      for re in &device_extensions {
        contains := false
        for e in &extensions {
          name := transmute(cstring) &e.extensionName
          if re == name {
            contains = true
            break
          }
        }
        if !contains {
          required_extensions = false
          break
        }
      }
      
      capabilities : vk.SurfaceCapabilitiesKHR
      vk.GetPhysicalDeviceSurfaceCapabilitiesKHR(pd, surface, &capabilities)

      format_count : u32
      vk.GetPhysicalDeviceSurfaceFormatsKHR(pd, surface, &format_count, nil)
      if format_count == 0 {
        continue
      }
      formats := make([]vk.SurfaceFormatKHR, int(format_count)); defer delete(formats)
      vk.GetPhysicalDeviceSurfaceFormatsKHR(pd, surface, &format_count, raw_data(formats))

      present_mode_count : u32
      vk.GetPhysicalDeviceSurfacePresentModesKHR(pd, surface, &present_mode_count, nil)
      if present_mode_count == 0 {
        continue
      }
      present_modes := make([]vk.PresentModeKHR, int(present_mode_count)); defer delete(present_modes)
      vk.GetPhysicalDeviceSurfacePresentModesKHR(pd, surface, &present_mode_count, raw_data(present_modes))

      queue_family_count : u32
      vk.GetPhysicalDeviceQueueFamilyProperties(pd, &queue_family_count, nil)
      queue_families := make([]vk.QueueFamilyProperties, int(queue_family_count)); defer delete(queue_families)
      vk.GetPhysicalDeviceQueueFamilyProperties(pd, &queue_family_count, raw_data(queue_families))

      graphics_index := -1
      present_index := -1

      for qf, i in &queue_families {
        if graphics_index == -1 && .GRAPHICS in qf.queueFlags {
          graphics_index = i
        }

        present_support : b32
        vk.GetPhysicalDeviceSurfaceSupportKHR(pd, u32(i), surface, &present_support)
        if present_index == -1 && present_support {
          present_index = i
        }

        if graphics_index != -1 && present_index != -1 {
          break
        }
      }

      if graphics_index != -1 && present_index != -1 {
        physical_device = pd
        device_capabilities = capabilities
        device_formats = slice.clone(formats)
        device_present_modes = slice.clone(present_modes)
        queue_family_graphics_index = graphics_index
        queue_family_present_index = present_index
        break
      }
    }

    if physical_device == nil {
      fmt.eprintln("suitable device not found")
      return
    }
  }

  device : vk.Device; defer vk.DestroyDevice(device, nil)
  graphics_queue : vk.Queue
  present_queue : vk.Queue
  {
    queue_families : map[int]int; defer delete(queue_families)
    queue_families[queue_family_graphics_index] += 1
    queue_families[queue_family_present_index] += 1

    queue_priorities := make([]f32, len(queue_families)); defer delete(queue_priorities)
    for qfc in 0..<len(queue_families) {
      queue_families[qfc] = 1.0
    }

    queue_create_infos : [dynamic]vk.DeviceQueueCreateInfo; defer delete(queue_create_infos)

    for family, count in &queue_families {
      append(&queue_create_infos, vk.DeviceQueueCreateInfo {
        sType = .DEVICE_QUEUE_CREATE_INFO,
        queueFamilyIndex = u32(family),
        queueCount = u32(count),
        pQueuePriorities = raw_data(queue_priorities),
      })
    }

    device_features := vk.PhysicalDeviceFeatures {}

    device_create_info := vk.DeviceCreateInfo {
      sType = .DEVICE_CREATE_INFO,
      queueCreateInfoCount = u32(len(queue_create_infos)),
      pQueueCreateInfos = raw_data(queue_create_infos),
      enabledExtensionCount = u32(len(device_extensions)),
      ppEnabledExtensionNames = raw_data(device_extensions),
      pEnabledFeatures = &device_features,
    }

    if result := vk.CreateDevice(physical_device, &device_create_info, nil, &device); result != .SUCCESS {
      fmt.eprintln("couldn't create vulkan device")
      return
    }

    vk.GetDeviceQueue(device, u32(queue_family_graphics_index), 0, &graphics_queue)
    if graphics_queue == nil {
      fmt.eprintln("couldn't create device queue")
      return
    }

    vk.GetDeviceQueue(device, u32(queue_family_present_index), 0, &present_queue)
    if present_queue == nil {
      fmt.eprintln("couldn't create present queue")
      return
    }
  }

  vk.load_proc_addresses(device)
  surface_format : vk.SurfaceFormatKHR
  present_mode : vk.PresentModeKHR
  swap_extent : vk.Extent2D
  swapchain : vk.SwapchainKHR; defer vk.DestroySwapchainKHR(device, swapchain, nil)

  swapchain_images : [dynamic]vk.Image; defer delete(swapchain_images)
  swapchain_image_views: [dynamic]vk.ImageView; defer delete(swapchain_image_views)

  defer for siv in &swapchain_image_views do vk.DestroyImageView(device, siv, nil)

  {
    ideal_format := false
    for f in &device_formats {
      if f.format == .B8G8R8A8_SRGB && f.colorSpace == .SRGB_NONLINEAR {
        surface_format = f
        ideal_format = true
        break
      }
    }

    if !ideal_format {
      surface_format = device_formats[0]
    }

    ideal_present_mode := false
    for pm in &device_present_modes {
      if pm == .MAILBOX {
        present_mode = pm
        ideal_present_mode = true
        break
      }
    }

    if !ideal_present_mode {
      present_mode = .FIFO
    }

    swap_extent = device_capabilities.currentExtent
    if swap_extent.width == max(u32) {
      width, height := glfw.GetFramebufferSize(window)
      swap_extent.width = clamp(u32(width), device_capabilities.minImageExtent.width, device_capabilities.maxImageExtent.width)
      swap_extent.height = clamp(u32(height), device_capabilities.minImageExtent.height, device_capabilities.maxImageExtent.height)
    }

    image_count := device_capabilities.minImageCount + 1
    if device_capabilities.maxImageCount > 0 && image_count > device_capabilities.maxImageCount {
      image_count = device_capabilities.maxImageCount
    }

    swapchain_create_info := vk.SwapchainCreateInfoKHR {
      sType = .SWAPCHAIN_CREATE_INFO_KHR,
      surface = surface,
      minImageCount = image_count,
      imageFormat = surface_format.format,
      imageColorSpace = surface_format.colorSpace,
      imageExtent = swap_extent,
      imageArrayLayers = 1,
      imageUsage = { .COLOR_ATTACHMENT },
      imageSharingMode = .EXCLUSIVE,
      preTransform = device_capabilities.currentTransform,
      compositeAlpha = { .OPAQUE },
      presentMode = present_mode,
      clipped = true,
    }

    queue_families := []u32 { u32(queue_family_graphics_index), u32(queue_family_present_index) }
    if queue_family_graphics_index != queue_family_present_index {
      swapchain_create_info.imageSharingMode = .CONCURRENT
      swapchain_create_info.queueFamilyIndexCount = 2
      swapchain_create_info.pQueueFamilyIndices = raw_data(queue_families)
    }

    if vk.CreateSwapchainKHR(device, &swapchain_create_info, nil, &swapchain) != .SUCCESS {
      fmt.eprintln("couldn't create swapchain")
      return
    }

    vk.GetSwapchainImagesKHR(device, swapchain, &image_count, nil)
    resize(&swapchain_images, int(image_count))
    vk.GetSwapchainImagesKHR(device, swapchain, &image_count, raw_data(swapchain_images))

    resize(&swapchain_image_views, len(swapchain_images))
    for i in 0..<len(swapchain_image_views) {
      image_view_create_info := vk.ImageViewCreateInfo {
        sType = .IMAGE_VIEW_CREATE_INFO,
        image = swapchain_images[i],
        viewType = .D2,
        format = surface_format.format,
        components = {
          r = .IDENTITY,
          g = .IDENTITY,
          b = .IDENTITY,
          a = .IDENTITY,
        },
        subresourceRange = {
          aspectMask = { .COLOR },
          baseMipLevel = 0,
          levelCount = 1,
          baseArrayLayer = 0,
          layerCount = 1,
        },
      }

      if vk.CreateImageView(device, &image_view_create_info, nil, &swapchain_image_views[i]) != .SUCCESS {
        fmt.eprintln("error creating image view", i)
      }
    }
  }

  render_pass : vk.RenderPass; defer vk.DestroyRenderPass(device, render_pass, nil)
  {
    colour_attachment := vk.AttachmentDescription {
      format = surface_format.format,
      samples = { ._1 },
      loadOp = .CLEAR,
      storeOp = .STORE,
      stencilLoadOp = .DONT_CARE,
      stencilStoreOp = .DONT_CARE,
      initialLayout = .UNDEFINED,
      finalLayout = .PRESENT_SRC_KHR,
    }
    colour_attachment_ref := vk.AttachmentReference {
      attachment = 0,
      layout = .COLOR_ATTACHMENT_OPTIMAL,
    }
    subpass := vk.SubpassDescription {
      pipelineBindPoint = .GRAPHICS,
      colorAttachmentCount = 1,
      pColorAttachments = &colour_attachment_ref,
    }
    dependency := vk.SubpassDependency {
      srcSubpass = vk.SUBPASS_EXTERNAL,
      dstSubpass = 0,
      srcStageMask = { .COLOR_ATTACHMENT_OUTPUT },
      dstStageMask = { .COLOR_ATTACHMENT_OUTPUT },
      dstAccessMask = { .COLOR_ATTACHMENT_WRITE },
    }

    render_pass_info := vk.RenderPassCreateInfo {
      sType = .RENDER_PASS_CREATE_INFO,
      attachmentCount = 1,
      pAttachments = & colour_attachment,
      subpassCount = 1,
      pSubpasses = &subpass,
      dependencyCount = 1,
      pDependencies = &dependency,
    }

    if vk.CreateRenderPass(device, &render_pass_info, nil, &render_pass) != .SUCCESS {
      fmt.eprintln("couldn't create render pass")
      return
    }
  }

  graphics_pipleline : vk.Pipeline; defer vk.DestroyPipeline(device, graphics_pipleline, nil)
  pipeline_layout : vk.PipelineLayout; defer vk.DestroyPipelineLayout(device, pipeline_layout, nil)
  {
    vertex_shader_code := #load("./assets/shaders/debug.vert.spv")
    fragment_shader_code := #load("./assets/shaders/debug.frag.spv")

    vertex_module_info := vk.ShaderModuleCreateInfo {
      sType = .SHADER_MODULE_CREATE_INFO,
      codeSize = len(vertex_shader_code),
      pCode = cast(^u32) raw_data(vertex_shader_code),
    }
    vertex_shader_module : vk.ShaderModule; defer vk.DestroyShaderModule(device, vertex_shader_module, nil)
    vk.CreateShaderModule(device, &vertex_module_info, nil, &vertex_shader_module)

    fragment_module_info := vk.ShaderModuleCreateInfo {
      sType = .SHADER_MODULE_CREATE_INFO,
      codeSize = len(fragment_shader_code),
      pCode = cast(^u32) raw_data(fragment_shader_code),
    }
    fragment_shader_module : vk.ShaderModule; defer vk.DestroyShaderModule(device, fragment_shader_module, nil)
    vk.CreateShaderModule(device, &fragment_module_info, nil, &fragment_shader_module)

    vertex_stage_info := vk.PipelineShaderStageCreateInfo {
      sType = .PIPELINE_SHADER_STAGE_CREATE_INFO,
      stage = { .VERTEX },
      module = vertex_shader_module,
      pName = "main",
    }
    fragment_stage_info := vk.PipelineShaderStageCreateInfo {
      sType = .PIPELINE_SHADER_STAGE_CREATE_INFO,
      stage = { .FRAGMENT },
      module = fragment_shader_module,
      pName = "main",
    }
    shader_stages := []vk.PipelineShaderStageCreateInfo{vertex_stage_info, fragment_stage_info}

    vertex_input_info := vk.PipelineVertexInputStateCreateInfo {
      sType =.PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
    }

    input_assembly_info := vk.PipelineInputAssemblyStateCreateInfo {
      sType = .PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
      topology =.TRIANGLE_LIST,
      primitiveRestartEnable = false,
    }

    viewport := vk.Viewport {
      x = 0.0,
      y = 0.0,
      width = cast(f32) swap_extent.width,
      height = cast(f32) swap_extent.height,
      minDepth = 0.0,
      maxDepth = 1.0,
    }

    scissor := vk.Rect2D {
      offset = { 0, 0 },
      extent = swap_extent,
    }

    viewport_state := vk.PipelineViewportStateCreateInfo {
      sType = .PIPELINE_VIEWPORT_STATE_CREATE_INFO,
      viewportCount = 1,
      pViewports = &viewport,
      scissorCount = 1,
      pScissors = &scissor,
    }

    rasterizer := vk.PipelineRasterizationStateCreateInfo {
      sType = .PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
      depthClampEnable = false,
      rasterizerDiscardEnable = false,
      polygonMode = .FILL,
      lineWidth = 1.0,
      cullMode = { .BACK },
      frontFace = .CLOCKWISE,
      depthBiasEnable = false,
    }
    
    multisampling := vk.PipelineMultisampleStateCreateInfo {
      sType = .PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
      sampleShadingEnable = false,
      rasterizationSamples = { ._1 },
    }

    color_blend_attachment := vk.PipelineColorBlendAttachmentState {
      colorWriteMask = { .R, .G, .B, .A },
      blendEnable = true,
      srcColorBlendFactor = .ONE,
      dstColorBlendFactor = .ZERO,
      colorBlendOp = .ADD,
      srcAlphaBlendFactor = .ONE,
      dstAlphaBlendFactor = .ZERO,
      alphaBlendOp = .ADD,
    }

    color_blending := vk.PipelineColorBlendStateCreateInfo {
      sType = .PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
      logicOpEnable = false,
      logicOp = .COPY,
      attachmentCount = 1,
      pAttachments = &color_blend_attachment,
      blendConstants = { 0.0, 0.0, 0.0, 0.0 },
    }

    pipeline_layout_info := vk.PipelineLayoutCreateInfo {
      sType = .PIPELINE_LAYOUT_CREATE_INFO,
    }

    if vk.CreatePipelineLayout(device, &pipeline_layout_info, nil, &pipeline_layout) != .SUCCESS {
      fmt.eprintln("couldn't create pipeline layout")
      return
    }

    pipeline_info := vk.GraphicsPipelineCreateInfo {
      sType = .GRAPHICS_PIPELINE_CREATE_INFO,
      stageCount = u32(len(shader_stages)),
      pStages = raw_data(shader_stages),
      pVertexInputState = &vertex_input_info,
      pInputAssemblyState = &input_assembly_info,
      pViewportState = &viewport_state,
      pRasterizationState = &rasterizer,
      pMultisampleState = &multisampling,
      pColorBlendState = &color_blending,
      layout = pipeline_layout,
      renderPass = render_pass,
      subpass = 0,
    }

    if vk.CreateGraphicsPipelines(device, 0, 1, &pipeline_info, nil, &graphics_pipleline) != .SUCCESS {
      fmt.eprintln("couldn't create graphics pipeline")
      return
    }
  }

  swapchain_framebuffers : [dynamic]vk.Framebuffer; defer delete(swapchain_framebuffers)
  defer for sf in &swapchain_framebuffers do vk.DestroyFramebuffer(device, sf, nil)
  {
    resize(&swapchain_framebuffers, len(swapchain_image_views))

    for i in 0..<len(swapchain_image_views) {
      attachements := []vk.ImageView {
        swapchain_image_views[i],
      }

      framebuffer_info := vk.FramebufferCreateInfo {
        sType = .FRAMEBUFFER_CREATE_INFO,
        renderPass = render_pass,
        attachmentCount = 1,
        pAttachments = raw_data(attachements),
        width = swap_extent.width,
        height = swap_extent.height,
        layers = 1,
      }

      if vk.CreateFramebuffer(device, &framebuffer_info, nil, &swapchain_framebuffers[i]) != .SUCCESS {
        fmt.eprintln("failed to create framebuffer", i)
        return
      }
    }
  }

  command_pool : vk.CommandPool; defer vk.DestroyCommandPool(device, command_pool, nil)
  command_buffers : [dynamic]vk.CommandBuffer; defer delete(command_buffers)
  {
    pool_info := vk.CommandPoolCreateInfo {
      sType = .COMMAND_POOL_CREATE_INFO,
      queueFamilyIndex = u32(queue_family_graphics_index),
    }

    if vk.CreateCommandPool(device, &pool_info, nil, &command_pool) != .SUCCESS {
      fmt.eprintln("couldn't create command pool")
      return
    }

    resize(&command_buffers, len(swapchain_framebuffers))
    alloc_info := vk.CommandBufferAllocateInfo {
      sType = .COMMAND_BUFFER_ALLOCATE_INFO,
      commandPool = command_pool,
      level = .PRIMARY,
      commandBufferCount = u32(len(command_buffers)),
    }

    if vk.AllocateCommandBuffers(device, &alloc_info, raw_data(command_buffers)) != .SUCCESS {
      fmt.eprintln("couldn't allocate command buffers")
      return
    }

    for cb, i in &command_buffers {
      begin_info := vk.CommandBufferBeginInfo {
        sType = .COMMAND_BUFFER_BEGIN_INFO,
      }

      clear_colour := vk.ClearValue{
				color = { float32 = { 0.03561436968491878157417676879363, 0.22713652550514897375949232016547, 0.65237010541082120207337791500345, 1.0 } },
			}

      render_pass_info := vk.RenderPassBeginInfo {
        sType = .RENDER_PASS_BEGIN_INFO,
        renderPass = render_pass,
        framebuffer = swapchain_framebuffers[i],
        renderArea = {
          offset = {0, 0},
          extent = swap_extent,
        },
        clearValueCount = 1,
        pClearValues = &clear_colour,
      }

      vk.BeginCommandBuffer(cb, &begin_info)
      vk.CmdBeginRenderPass(cb, &render_pass_info, .INLINE)
      vk.CmdBindPipeline(cb, .GRAPHICS, graphics_pipleline)

      vk.CmdDraw(cb, 3, 1, 0, 0)
      vk.CmdEndRenderPass(cb)

      if vk.EndCommandBuffer(cb) != .SUCCESS {
        fmt.eprintln("couldn't end commadn buffer", i)
        return
      }
    }
  }

  frames_in_flight := 2
  max_frames_in_flight := clamp(frames_in_flight, 0, len(swapchain_images))
  flight_frame := 0
  image_available_semaphores : [dynamic]vk.Semaphore; defer delete(image_available_semaphores)
  defer for ias in &image_available_semaphores do vk.DestroySemaphore(device, ias, nil)
  render_finished_semaphores : [dynamic]vk.Semaphore; defer delete(render_finished_semaphores)
  defer for rfs in &render_finished_semaphores do vk.DestroySemaphore(device, rfs, nil)
  in_flight_fences : [dynamic]vk.Fence; defer delete(in_flight_fences)
  defer for iff in &in_flight_fences do vk.DestroyFence(device, iff, nil)
  images_in_flight :[dynamic]vk.Fence; defer delete(images_in_flight)
  {
    resize(&image_available_semaphores, max_frames_in_flight)
    resize(&render_finished_semaphores, max_frames_in_flight)
    resize(&in_flight_fences, max_frames_in_flight)
    resize(&images_in_flight, len(swapchain_images))

    semaphore_info := vk.SemaphoreCreateInfo {
      sType = .SEMAPHORE_CREATE_INFO,
    }
    fence_info := vk.FenceCreateInfo {
      sType = .FENCE_CREATE_INFO,
      flags = { .SIGNALED },
    }
    for i in 0..<max_frames_in_flight {
      if vk.CreateSemaphore(device, &semaphore_info, nil, &image_available_semaphores[i]) != .SUCCESS ||
      vk.CreateSemaphore(device, &semaphore_info, nil, &render_finished_semaphores[i]) != .SUCCESS ||
      vk.CreateFence(device, &fence_info, nil, &in_flight_fences[i]) != .SUCCESS {
        fmt.eprintln("failed to create sync objects")
        return
      }
    }
  }

  running := true
  for running {
    glfw.PollEvents()

    vk.WaitForFences(device, 1, &in_flight_fences[flight_frame], true, max(u64))
    
    image_index : u32
    vk.AcquireNextImageKHR(device, swapchain, max(u64), image_available_semaphores[flight_frame], 0, &image_index)

    if images_in_flight[image_index] != 0 {
      vk.WaitForFences(device, 1, &images_in_flight[image_index], true, max(u64))
    }
    images_in_flight[image_index] = in_flight_fences[flight_frame]
    wait_semaphore := []vk.Semaphore { image_available_semaphores[flight_frame] }
    signal_semaphore := []vk.Semaphore { render_finished_semaphores[flight_frame] }
    flight_frame = (flight_frame + 1) & max_frames_in_flight

    submit_info := vk.SubmitInfo {
      sType = .SUBMIT_INFO,
      waitSemaphoreCount = u32(len(wait_semaphore)),
      pWaitSemaphores = raw_data(wait_semaphore),
      pWaitDstStageMask = &vk.PipelineStageFlags { .COLOR_ATTACHMENT_OUTPUT },
      commandBufferCount = 1,
      pCommandBuffers = &command_buffers[image_index],
      signalSemaphoreCount = u32(len(signal_semaphore)),
      pSignalSemaphores = raw_data(signal_semaphore),
    }
    vk.ResetFences(device, 1, &in_flight_fences[flight_frame])
    vk.QueueSubmit(graphics_queue, 1, &submit_info, in_flight_fences[flight_frame])

    swapchains := []vk.SwapchainKHR { swapchain }
    present_info := vk.PresentInfoKHR {
      sType = .PRESENT_INFO_KHR,
      waitSemaphoreCount = u32(len(signal_semaphore)),
      pWaitSemaphores = raw_data(signal_semaphore),
      swapchainCount = u32(len(swapchains)),
      pSwapchains = raw_data(swapchains),
      pImageIndices = &image_index,
    }
    vk.QueuePresentKHR(present_queue, &present_info)
    vk.QueueWaitIdle(present_queue)
  }

  vk.DeviceWaitIdle(device)
}

main :: proc() {
  track: mem.Tracking_Allocator
  mem.tracking_allocator_init(&track, context.allocator)
  defer mem.tracking_allocator(&track)
  context.allocator = mem.tracking_allocator(&track)
  start()

  for _, v in track.allocation_map {
    fmt.println()
    fmt.eprintf("%v Leaked %v bytes.", v.location, v.size)
    fmt.println()
  }
 
  for v in track.bad_free_array {
    fmt.println()
    fmt.eprintf("%v Bad free.", v.location)
    fmt.println()
  }
}