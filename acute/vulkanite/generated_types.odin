package vulkanite 

import vk "vendor:vulkan"

Extension :: enum {
  ShaderViewportIndexLayer, // VK_EXT_shader_viewport_index_layer
  NV_FragmentShaderBarycentric, // VK_NV_fragment_shader_barycentric
  NV_MeshShader, // VK_NV_mesh_shader
  DynamicRendering, // VK_KHR_dynamic_rendering
  GlobalPriorityQuery, // VK_EXT_global_priority_query
  AMD_ShaderTrinaryMinmax, // VK_AMD_shader_trinary_minmax
  ToolingInfo, // VK_EXT_tooling_info
  NV_ComputeShaderDerivatives, // VK_NV_compute_shader_derivatives
  AMD_RasterizationOrder, // VK_AMD_rasterization_order
  AMD_ImageLayoutResolve, // VK_AMD_image_layout_resolve
  RelaxedBlockLayout, // VK_KHR_relaxed_block_layout
  ConditionalRendering, // VK_EXT_conditional_rendering
  AstcDecodeMode, // VK_EXT_astc_decode_mode
  IndexTypeUint8, // VK_EXT_index_type_uint8
  NV_TextureDirtyTileMap, // VK_NV_texture_dirty_tile_map
  RayTracingPipeline, // VK_KHR_ray_tracing_pipeline
  StorageBufferStorageClass, // VK_KHR_storage_buffer_storage_class
  IncrementalPresent, // VK_KHR_incremental_present
  NV_CooperativeMatrix, // VK_NV_cooperative_matrix
  RayTracingMaintenance1, // VK_KHR_ray_tracing_maintenance1
  FormatFeatureFlags2, // VK_KHR_format_feature_flags2
  DescriptorUpdateTemplate, // VK_KHR_descriptor_update_template
  QCOM_RenderPassShaderResolve, // VK_QCOM_render_pass_shader_resolve
  AMD_MixedAttachmentSamples, // VK_AMD_mixed_attachment_samples
  Maintenance1, // VK_KHR_maintenance1
  Image2dViewOf3d, // VK_EXT_image_2d_view_of_3d
  GOOGLE_DecorateString, // VK_GOOGLE_decorate_string
  QCOM_RotatedCopyCommands, // VK_QCOM_rotated_copy_commands
  Robustness2, // VK_EXT_robustness2
  PortabilitySubset, // VK_KHR_portability_subset
  TransformFeedback, // VK_EXT_transform_feedback
  GOOGLE_SamplerFilteringPrecision, // VK_GOOGLE_sampler_filtering_precision
  AMD_GcnShader, // VK_AMD_gcn_shader
  PipelineCreationCacheControl, // VK_EXT_pipeline_creation_cache_control
  NV_AcquireWinrtDisplay, // VK_NV_acquire_winrt_display
  Swapchain, // VK_KHR_swapchain
  PerformanceQuery, // VK_KHR_performance_query
  RayQuery, // VK_KHR_ray_query
  Invalid, // VK_Invalid
  NV_RayTracingMotionBlur, // VK_NV_ray_tracing_motion_blur
  AMD_GpaInterface, // VK_AMD_gpa_interface
  NV_RepresentativeFragmentTest, // VK_NV_representative_fragment_test
  DeviceGroup, // VK_KHR_device_group
  KHX_ExternalSemaphoreWin32, // VK_KHX_external_semaphore_win32
  VideoDecodeQueue, // VK_KHR_video_decode_queue
  ShaderModuleIdentifier, // VK_EXT_shader_module_identifier
  NV_DeviceDiagnosticCheckpoints, // VK_NV_device_diagnostic_checkpoints
  AMD_PipelineCompilerControl, // VK_AMD_pipeline_compiler_control
  ShaderSubgroupUniformControlFlow, // VK_KHR_shader_subgroup_uniform_control_flow
  VideoEncodeH264, // VK_EXT_video_encode_h264
  ScalarBlockLayout, // VK_EXT_scalar_block_layout
  Maintenance4, // VK_KHR_maintenance4
  NV_FragmentCoverageToColor, // VK_NV_fragment_coverage_to_color
  NV_Win32KeyedMutex, // VK_NV_win32_keyed_mutex
  ShaderDemoteToHelperInvocation, // VK_EXT_shader_demote_to_helper_invocation
  ExternalMemoryWin32, // VK_KHR_external_memory_win32
  Win32KeyedMutex, // VK_KHR_win32_keyed_mutex
  NV_FillRectangle, // VK_NV_fill_rectangle
  XcbSurface, // VK_KHR_xcb_surface
  AccelerationStructure, // VK_KHR_acceleration_structure
  ExternalFenceWin32, // VK_KHR_external_fence_win32
  Maintenance3, // VK_KHR_maintenance3
  ExternalSemaphoreFd, // VK_KHR_external_semaphore_fd
  MVKMacosSurface, // VK_MVK_macos_surface
  MemoryBudget, // VK_EXT_memory_budget
  AMD_ShaderExplicitVertexParameter, // VK_AMD_shader_explicit_vertex_parameter
  CustomBorderColor, // VK_EXT_custom_border_color
  FilterCubic, // VK_EXT_filter_cubic
  DebugMarker, // VK_EXT_debug_marker
  GetPhysicalDeviceProperties2, // VK_KHR_get_physical_device_properties2
  KHX_ExternalMemoryFd, // VK_KHX_external_memory_fd
  DisplaySwapchain, // VK_KHR_display_swapchain
  HUAWEISmartCache, // VK_HUAWEI_smart_cache
  INTELShaderIntegerFunctions2, // VK_INTEL_shader_integer_functions2
  KHX_Win32KeyedMutex, // VK_KHX_win32_keyed_mutex
  NV_ExternalMemory, // VK_NV_external_memory
  PresentId, // VK_KHR_present_id
  KHX_Multiview, // VK_KHX_multiview
  Surface, // VK_KHR_surface
  TexelBufferAlignment, // VK_EXT_texel_buffer_alignment
  VertexInputDynamicState, // VK_EXT_vertex_input_dynamic_state
  ShaderSubgroupExtendedTypes, // VK_KHR_shader_subgroup_extended_types
  VideoQueue, // VK_KHR_video_queue
  Rgba10x6Formats, // VK_EXT_rgba10x6_formats
  VideoDecodeH264, // VK_EXT_video_decode_h264
  NV_XImageClearPadding, // VK_NVX_image_clear_padding
  LineRasterization, // VK_EXT_line_rasterization
  PresentWait, // VK_KHR_present_wait
  FragmentDensityMap, // VK_EXT_fragment_density_map
  ExternalMemoryFd, // VK_KHR_external_memory_fd
  NV_ViewportSwizzle, // VK_NV_viewport_swizzle
  TextureCompressionAstcHdr, // VK_EXT_texture_compression_astc_hdr
  BorderColorSwizzle, // VK_EXT_border_color_swizzle
  BufferDeviceAddress, // VK_KHR_buffer_device_address
  AMD_MemoryOverallocationBehavior, // VK_AMD_memory_overallocation_behavior
  GetMemoryRequirements2, // VK_KHR_get_memory_requirements2
  GraphicsPipelineLibrary, // VK_EXT_graphics_pipeline_library
  AMD_GpuShaderHalfFloat, // VK_AMD_gpu_shader_half_float
  ShaderAtomicFloat, // VK_EXT_shader_atomic_float
  Synchronization2, // VK_KHR_synchronization2
  EXT_4444Formats, // VK_EXT_4444_formats
  NV_DeviceDebugCheckpoints, // VK_NV_device_debug_checkpoints
  ShaderStencilExport, // VK_EXT_shader_stencil_export
  ShaderImageAtomicInt64, // VK_EXT_shader_image_atomic_int64
  FragmentShaderBarycentric, // VK_KHR_fragment_shader_barycentric
  ImagelessFramebuffer, // VK_KHR_imageless_framebuffer
  NV_CoverageReductionMode, // VK_NV_coverage_reduction_mode
  KHX_ExternalMemory, // VK_KHX_external_memory
  RayTracing, // VK_KHR_ray_tracing
  NV_ClipSpaceWScaling, // VK_NV_clip_space_w_scaling
  GOOGLE_HlslFunctionality1, // VK_GOOGLE_hlsl_functionality1
  AMD_CalibratedTimestamps, // VK_AMD_calibrated_timestamps
  AMD_NegativeViewportHeight, // VK_AMD_negative_viewport_height
  QueueFamilyForeign, // VK_EXT_queue_family_foreign
  VertexAttributeDivisor, // VK_EXT_vertex_attribute_divisor
  ShaderAtomicInt64, // VK_KHR_shader_atomic_int64
  NonSeamlessCubeMap, // VK_EXT_non_seamless_cube_map
  FragmentShaderInterlock, // VK_EXT_fragment_shader_interlock
  ShaderSubgroupBallot, // VK_EXT_shader_subgroup_ballot
  ProvokingVertex, // VK_EXT_provoking_vertex
  YcbcrImageArrays, // VK_EXT_ycbcr_image_arrays
  IMGConditionalRenderingComparisonInfo, // VK_IMG_conditional_rendering_comparison_info
  IMGFormatPvrtc, // VK_IMG_format_pvrtc
  KHX_ExternalMemoryCapabilities, // VK_KHX_external_memory_capabilities
  NV_ExternalMemoryWin32, // VK_NV_external_memory_win32
  IMGFilterCubic, // VK_IMG_filter_cubic
  SeparateDepthStencilLayouts, // VK_KHR_separate_depth_stencil_layouts
  ShaderSubgroupVote, // VK_EXT_shader_subgroup_vote
  NV_RayTracing, // VK_NV_ray_tracing
  VALVE_MutableDescriptorType, // VK_VALVE_mutable_descriptor_type
  ExternalFenceFd, // VK_KHR_external_fence_fd
  PipelineExecutableProperties, // VK_KHR_pipeline_executable_properties
  PipelineLibrary, // VK_KHR_pipeline_library
  NV_XDeviceGeneratedCommands, // VK_NVX_device_generated_commands
  ValidationCache, // VK_EXT_validation_cache
  NV_DedicatedAllocationImageAliasing, // VK_NV_dedicated_allocation_image_aliasing
  AMD_DrawIndirectCount, // VK_AMD_draw_indirect_count
  PciBusInfo, // VK_EXT_pci_bus_info
  ShaderNonSemanticInfo, // VK_KHR_shader_non_semantic_info
  PageableDeviceLocalMemory, // VK_EXT_pageable_device_local_memory
  PipelineRobustness, // VK_EXT_pipeline_robustness
  ExternalSemaphore, // VK_KHR_external_semaphore
  KHR_16bitStorage, // VK_KHR_16bit_storage
  NV_VideoQueue, // VK_NV_video_queue
  QCOM_FragmentDensityMapOffset, // VK_QCOM_fragment_density_map_offset
  DebugUtils, // VK_EXT_debug_utils
  ColorWriteEnable, // VK_EXT_color_write_enable
  PrimitivesGeneratedQuery, // VK_EXT_primitives_generated_query
  ZeroInitializeWorkgroupMemory, // VK_KHR_zero_initialize_workgroup_memory
  ARMRasterizationOrderAttachmentAccess, // VK_ARM_rasterization_order_attachment_access
  ImageViewMinLod, // VK_EXT_image_view_min_lod
  NV_ShaderSubgroupPartitioned, // VK_NV_shader_subgroup_partitioned
  SharedPresentableImage, // VK_KHR_shared_presentable_image
  NV_ShadingRateImage, // VK_NV_shading_rate_image
  PrimitiveTopologyListRestart, // VK_EXT_primitive_topology_list_restart
  DeferredHostOperations, // VK_KHR_deferred_host_operations
  NV_SampleMaskOverrideCoverage, // VK_NV_sample_mask_override_coverage
  QCOM_RenderPassTransform, // VK_QCOM_render_pass_transform
  NV_ExternalMemoryRdma, // VK_NV_external_memory_rdma
  INTELPerformanceQuery, // VK_INTEL_performance_query
  DriverProperties, // VK_KHR_driver_properties
  ExtendedDynamicState2, // VK_EXT_extended_dynamic_state2
  NV_ShaderSmBuiltins, // VK_NV_shader_sm_builtins
  DepthClipControl, // VK_EXT_depth_clip_control
  NV_ShaderImageFootprint, // VK_NV_shader_image_footprint
  ShaderFloat16Int8, // VK_KHR_shader_float16_int8
  AMD_ShaderCoreProperties2, // VK_AMD_shader_core_properties2
  AMD_DeviceCoherentMemory, // VK_AMD_device_coherent_memory
  EXT_2dImageview3dImage, // VK_EXT_2d_imageview_3d_image
  ExternalMemoryDmaBuf, // VK_EXT_external_memory_dma_buf
  NV_ViewportArray2, // VK_NV_viewport_array2
  UniformBufferStandardLayout, // VK_KHR_uniform_buffer_standard_layout
  ANDROIDExternalMemoryAndroidHardwareBuffer, // VK_ANDROID_external_memory_android_hardware_buffer
  NV_CornerSampledImage, // VK_NV_corner_sampled_image
  NV_LinearColorAttachment, // VK_NV_linear_color_attachment
  ShaderFloatControls, // VK_KHR_shader_float_controls
  AMD_WaveLimits, // VK_AMD_wave_limits
  NV_DedicatedAllocation, // VK_NV_dedicated_allocation
  ShaderTerminateInvocation, // VK_KHR_shader_terminate_invocation
  AMD_GpuShaderInt16, // VK_AMD_gpu_shader_int16
  Maintenance2, // VK_KHR_maintenance2
  SeparateStencilUsage, // VK_EXT_separate_stencil_usage
  FullScreenExclusive, // VK_EXT_full_screen_exclusive
  AMD_ShaderInfo, // VK_AMD_shader_info
  AMD_ShaderImageLoadStoreLod, // VK_AMD_shader_image_load_store_lod
  PostDepthCoverage, // VK_EXT_post_depth_coverage
  ShaderAtomicFloat2, // VK_EXT_shader_atomic_float2
  FragmentShadingRate, // VK_KHR_fragment_shading_rate
  SubgroupSizeControl, // VK_EXT_subgroup_size_control
  ExternalMemoryHost, // VK_EXT_external_memory_host
  AMD_ShaderFragmentMask, // VK_AMD_shader_fragment_mask
  DepthClipEnable, // VK_EXT_depth_clip_enable
  NV_XMultiviewPerViewAttributes, // VK_NVX_multiview_per_view_attributes
  VALVE_DescriptorSetHostMapping, // VK_VALVE_descriptor_set_host_mapping
  SampleLocations, // VK_EXT_sample_locations
  FragmentDensityMap2, // VK_EXT_fragment_density_map2
  CreateRenderpass2, // VK_KHR_create_renderpass2
  KHX_ExternalSemaphore, // VK_KHX_external_semaphore
  CalibratedTimestamps, // VK_EXT_calibrated_timestamps
  MetalObjects, // VK_EXT_metal_objects
  PipelineCreationFeedback, // VK_EXT_pipeline_creation_feedback
  MESA_QueryTimestamp, // VK_MESA_query_timestamp
  ConservativeRasterization, // VK_EXT_conservative_rasterization
  NV_XBinaryImport, // VK_NVX_binary_import
  NV_GeometryShaderPassthrough, // VK_NV_geometry_shader_passthrough
  SamplerFilterMinmax, // VK_EXT_sampler_filter_minmax
  VideoDecodeH265, // VK_EXT_video_decode_h265
  MVKMoltenvk, // VK_MVK_moltenvk
  DiscardRectangles, // VK_EXT_discard_rectangles
  HdrMetadata, // VK_EXT_hdr_metadata
  DisplayControl, // VK_EXT_display_control
  Ycbcr2plane444Formats, // VK_EXT_ycbcr_2plane_444_formats
  ANDROIDNativeBuffer, // VK_ANDROID_native_buffer
  NV_PresentBarrier, // VK_NV_present_barrier
  ImageDrmFormatModifier, // VK_EXT_image_drm_format_modifier
  PhysicalDeviceDrm, // VK_EXT_physical_device_drm
  KHX_ExternalMemoryWin32, // VK_KHX_external_memory_win32
  NV_GlslShader, // VK_NV_glsl_shader
  VulkanMemoryModel, // VK_KHR_vulkan_memory_model
  AMD_GpuShaderHalfFloatFetch, // VK_AMD_gpu_shader_half_float_fetch
  NV_FragmentShadingRateEnums, // VK_NV_fragment_shading_rate_enums
  ExtendedDynamicState, // VK_EXT_extended_dynamic_state
  Multiview, // VK_KHR_multiview
  Spirv14, // VK_KHR_spirv_1_4
  AMD_ShaderEarlyAndLateFragmentTests, // VK_AMD_shader_early_and_late_fragment_tests
  DepthRangeUnrestricted, // VK_EXT_depth_range_unrestricted
  DebugReport, // VK_EXT_debug_report
  SwapchainColorspace, // VK_EXT_swapchain_colorspace
  InlineUniformBlock, // VK_EXT_inline_uniform_block
  MultiDraw, // VK_EXT_multi_draw
  DepthStencilResolve, // VK_KHR_depth_stencil_resolve
  QCOM_RenderPassStoreOps, // VK_QCOM_render_pass_store_ops
  KHX_DeviceGroup, // VK_KHX_device_group
  PushDescriptor, // VK_KHR_push_descriptor
  NV_DeviceGeneratedCommands, // VK_NV_device_generated_commands
  CopyCommands2, // VK_KHR_copy_commands2
  XPortabilitySubset, // VK_EXTX_portability_subset
  ImageRobustness, // VK_EXT_image_robustness
  ExternalMemory, // VK_KHR_external_memory
  AMD_TextureGatherBiasLod, // VK_AMD_texture_gather_bias_lod
  MemoryPriority, // VK_EXT_memory_priority
  VideoEncodeQueue, // VK_KHR_video_encode_queue
  NV_RdmaMemory, // VK_NV_rdma_memory
  NV_ScissorExclusive, // VK_NV_scissor_exclusive
  AMD_DisplayNativeHdr, // VK_AMD_display_native_hdr
  DeviceMemoryReport, // VK_EXT_device_memory_report
  LoadStoreOpNone, // VK_EXT_load_store_op_none
  ImageFormatList, // VK_KHR_image_format_list
  AMD_ShaderBallot, // VK_AMD_shader_ballot
  ShaderIntegerDotProduct, // VK_KHR_shader_integer_dot_product
  NV_CudaKernelLaunch, // VK_NV_cuda_kernel_launch
  SamplerYcbcrConversion, // VK_KHR_sampler_ycbcr_conversion
  HUAWEIPrerotation, // VK_HUAWEI_prerotation
  SamplerMirrorClampToEdge, // VK_KHR_sampler_mirror_clamp_to_edge
  BindMemory2, // VK_KHR_bind_memory2
  ShaderClock, // VK_KHR_shader_clock
  GOOGLE_DisplayTiming, // VK_GOOGLE_display_timing
  BlendOperationAdvanced, // VK_EXT_blend_operation_advanced
  GlobalPriority, // VK_KHR_global_priority
  DrawIndirectCount, // VK_KHR_draw_indirect_count
  VariablePointers, // VK_KHR_variable_pointers
  PrivateData, // VK_EXT_private_data
  ShaderDrawParameters, // VK_KHR_shader_draw_parameters
  Win32Surface, // VK_KHR_win32_surface
  DedicatedAllocation, // VK_KHR_dedicated_allocation
  KHX_ExternalSemaphoreFd, // VK_KHX_external_semaphore_fd
  SwapchainMutableFormat, // VK_KHR_swapchain_mutable_format
  NV_XRaytracing, // VK_NVX_raytracing
  NV_XImageViewHandle, // VK_NVX_image_view_handle
  DescriptorIndexing, // VK_EXT_descriptor_indexing
  HostQueryReset, // VK_EXT_host_query_reset
  TimelineSemaphore, // VK_KHR_timeline_semaphore
  NV_DeviceDiagnosticsConfig, // VK_NV_device_diagnostics_config
  NV_InheritedViewportScissor, // VK_NV_inherited_viewport_scissor
  AMD_BufferMarker, // VK_AMD_buffer_marker
  AMD_ShaderCoreProperties, // VK_AMD_shader_core_properties
  WorkgroupMemoryExplicitLayout, // VK_KHR_workgroup_memory_explicit_layout
  NV_XDisplayTiming, // VK_NVX_display_timing
  ExternalFence, // VK_KHR_external_fence
  GOOGLE_UserType, // VK_GOOGLE_user_type
  MVKIosSurface, // VK_MVK_ios_surface
  ExternalSemaphoreWin32, // VK_KHR_external_semaphore_win32
  NV_FramebufferMixedSamples, // VK_NV_framebuffer_mixed_samples
  KHR_8bitStorage, // VK_KHR_8bit_storage
  AMD_ProgrammableSampleLocations, // VK_AMD_programmable_sample_locations
  NV_LowLatency, // VK_NV_low_latency
}

import "core:fmt"

extension_to_raw :: proc(e: Extension) -> cstring {
  // fmt.println("ext CONV: ", e)
  switch e {
    case .ShaderViewportIndexLayer: return "VK_EXT_shader_viewport_index_layer"
    case .NV_FragmentShaderBarycentric: return "VK_NV_fragment_shader_barycentric"
    case .NV_MeshShader: return "VK_NV_mesh_shader"
    case .DynamicRendering: return "VK_KHR_dynamic_rendering"
    case .GlobalPriorityQuery: return "VK_EXT_global_priority_query"
    case .AMD_ShaderTrinaryMinmax: return "VK_AMD_shader_trinary_minmax"
    case .ToolingInfo: return "VK_EXT_tooling_info"
    case .NV_ComputeShaderDerivatives: return "VK_NV_compute_shader_derivatives"
    case .AMD_RasterizationOrder: return "VK_AMD_rasterization_order"
    case .AMD_ImageLayoutResolve: return "VK_AMD_image_layout_resolve"
    case .RelaxedBlockLayout: return "VK_KHR_relaxed_block_layout"
    case .ConditionalRendering: return "VK_EXT_conditional_rendering"
    case .AstcDecodeMode: return "VK_EXT_astc_decode_mode"
    case .IndexTypeUint8: return "VK_EXT_index_type_uint8"
    case .NV_TextureDirtyTileMap: return "VK_NV_texture_dirty_tile_map"
    case .RayTracingPipeline: return "VK_KHR_ray_tracing_pipeline"
    case .StorageBufferStorageClass: return "VK_KHR_storage_buffer_storage_class"
    case .IncrementalPresent: return "VK_KHR_incremental_present"
    case .NV_CooperativeMatrix: return "VK_NV_cooperative_matrix"
    case .RayTracingMaintenance1: return "VK_KHR_ray_tracing_maintenance1"
    case .FormatFeatureFlags2: return "VK_KHR_format_feature_flags2"
    case .DescriptorUpdateTemplate: return "VK_KHR_descriptor_update_template"
    case .QCOM_RenderPassShaderResolve: return "VK_QCOM_render_pass_shader_resolve"
    case .AMD_MixedAttachmentSamples: return "VK_AMD_mixed_attachment_samples"
    case .Maintenance1: return "VK_KHR_maintenance1"
    case .Image2dViewOf3d: return "VK_EXT_image_2d_view_of_3d"
    case .GOOGLE_DecorateString: return "VK_GOOGLE_decorate_string"
    case .QCOM_RotatedCopyCommands: return "VK_QCOM_rotated_copy_commands"
    case .Robustness2: return "VK_EXT_robustness2"
    case .PortabilitySubset: return "VK_KHR_portability_subset"
    case .TransformFeedback: return "VK_EXT_transform_feedback"
    case .GOOGLE_SamplerFilteringPrecision: return "VK_GOOGLE_sampler_filtering_precision"
    case .AMD_GcnShader: return "VK_AMD_gcn_shader"
    case .PipelineCreationCacheControl: return "VK_EXT_pipeline_creation_cache_control"
    case .NV_AcquireWinrtDisplay: return "VK_NV_acquire_winrt_display"
    case .Swapchain: return "VK_KHR_swapchain"
    case .PerformanceQuery: return "VK_KHR_performance_query"
    case .RayQuery: return "VK_KHR_ray_query"
    case .Invalid: return "VK_Invalid"
    case .NV_RayTracingMotionBlur: return "VK_NV_ray_tracing_motion_blur"
    case .AMD_GpaInterface: return "VK_AMD_gpa_interface"
    case .NV_RepresentativeFragmentTest: return "VK_NV_representative_fragment_test"
    case .DeviceGroup: return "VK_KHR_device_group"
    case .KHX_ExternalSemaphoreWin32: return "VK_KHX_external_semaphore_win32"
    case .VideoDecodeQueue: return "VK_KHR_video_decode_queue"
    case .ShaderModuleIdentifier: return "VK_EXT_shader_module_identifier"
    case .NV_DeviceDiagnosticCheckpoints: return "VK_NV_device_diagnostic_checkpoints"
    case .AMD_PipelineCompilerControl: return "VK_AMD_pipeline_compiler_control"
    case .ShaderSubgroupUniformControlFlow: return "VK_KHR_shader_subgroup_uniform_control_flow"
    case .VideoEncodeH264: return "VK_EXT_video_encode_h264"
    case .ScalarBlockLayout: return "VK_EXT_scalar_block_layout"
    case .Maintenance4: return "VK_KHR_maintenance4"
    case .NV_FragmentCoverageToColor: return "VK_NV_fragment_coverage_to_color"
    case .NV_Win32KeyedMutex: return "VK_NV_win32_keyed_mutex"
    case .ShaderDemoteToHelperInvocation: return "VK_EXT_shader_demote_to_helper_invocation"
    case .ExternalMemoryWin32: return "VK_KHR_external_memory_win32"
    case .Win32KeyedMutex: return "VK_KHR_win32_keyed_mutex"
    case .NV_FillRectangle: return "VK_NV_fill_rectangle"
    case .XcbSurface: return "VK_KHR_xcb_surface"
    case .AccelerationStructure: return "VK_KHR_acceleration_structure"
    case .ExternalFenceWin32: return "VK_KHR_external_fence_win32"
    case .Maintenance3: return "VK_KHR_maintenance3"
    case .ExternalSemaphoreFd: return "VK_KHR_external_semaphore_fd"
    case .MVKMacosSurface: return "VK_MVK_macos_surface"
    case .MemoryBudget: return "VK_EXT_memory_budget"
    case .AMD_ShaderExplicitVertexParameter: return "VK_AMD_shader_explicit_vertex_parameter"
    case .CustomBorderColor: return "VK_EXT_custom_border_color"
    case .FilterCubic: return "VK_EXT_filter_cubic"
    case .DebugMarker: return "VK_EXT_debug_marker"
    case .GetPhysicalDeviceProperties2: return "VK_KHR_get_physical_device_properties2"
    case .KHX_ExternalMemoryFd: return "VK_KHX_external_memory_fd"
    case .DisplaySwapchain: return "VK_KHR_display_swapchain"
    case .HUAWEISmartCache: return "VK_HUAWEI_smart_cache"
    case .INTELShaderIntegerFunctions2: return "VK_INTEL_shader_integer_functions2"
    case .KHX_Win32KeyedMutex: return "VK_KHX_win32_keyed_mutex"
    case .NV_ExternalMemory: return "VK_NV_external_memory"
    case .PresentId: return "VK_KHR_present_id"
    case .KHX_Multiview: return "VK_KHX_multiview"
    case .Surface: return "VK_KHR_surface"
    case .TexelBufferAlignment: return "VK_EXT_texel_buffer_alignment"
    case .VertexInputDynamicState: return "VK_EXT_vertex_input_dynamic_state"
    case .ShaderSubgroupExtendedTypes: return "VK_KHR_shader_subgroup_extended_types"
    case .VideoQueue: return "VK_KHR_video_queue"
    case .Rgba10x6Formats: return "VK_EXT_rgba10x6_formats"
    case .VideoDecodeH264: return "VK_EXT_video_decode_h264"
    case .NV_XImageClearPadding: return "VK_NVX_image_clear_padding"
    case .LineRasterization: return "VK_EXT_line_rasterization"
    case .PresentWait: return "VK_KHR_present_wait"
    case .FragmentDensityMap: return "VK_EXT_fragment_density_map"
    case .ExternalMemoryFd: return "VK_KHR_external_memory_fd"
    case .NV_ViewportSwizzle: return "VK_NV_viewport_swizzle"
    case .TextureCompressionAstcHdr: return "VK_EXT_texture_compression_astc_hdr"
    case .BorderColorSwizzle: return "VK_EXT_border_color_swizzle"
    case .BufferDeviceAddress: return "VK_KHR_buffer_device_address"
    case .AMD_MemoryOverallocationBehavior: return "VK_AMD_memory_overallocation_behavior"
    case .GetMemoryRequirements2: return "VK_KHR_get_memory_requirements2"
    case .GraphicsPipelineLibrary: return "VK_EXT_graphics_pipeline_library"
    case .AMD_GpuShaderHalfFloat: return "VK_AMD_gpu_shader_half_float"
    case .ShaderAtomicFloat: return "VK_EXT_shader_atomic_float"
    case .Synchronization2: return "VK_KHR_synchronization2"
    case .EXT_4444Formats: return "VK_EXT_4444_formats"
    case .NV_DeviceDebugCheckpoints: return "VK_NV_device_debug_checkpoints"
    case .ShaderStencilExport: return "VK_EXT_shader_stencil_export"
    case .ShaderImageAtomicInt64: return "VK_EXT_shader_image_atomic_int64"
    case .FragmentShaderBarycentric: return "VK_KHR_fragment_shader_barycentric"
    case .ImagelessFramebuffer: return "VK_KHR_imageless_framebuffer"
    case .NV_CoverageReductionMode: return "VK_NV_coverage_reduction_mode"
    case .KHX_ExternalMemory: return "VK_KHX_external_memory"
    case .RayTracing: return "VK_KHR_ray_tracing"
    case .NV_ClipSpaceWScaling: return "VK_NV_clip_space_w_scaling"
    case .GOOGLE_HlslFunctionality1: return "VK_GOOGLE_hlsl_functionality1"
    case .AMD_CalibratedTimestamps: return "VK_AMD_calibrated_timestamps"
    case .AMD_NegativeViewportHeight: return "VK_AMD_negative_viewport_height"
    case .QueueFamilyForeign: return "VK_EXT_queue_family_foreign"
    case .VertexAttributeDivisor: return "VK_EXT_vertex_attribute_divisor"
    case .ShaderAtomicInt64: return "VK_KHR_shader_atomic_int64"
    case .NonSeamlessCubeMap: return "VK_EXT_non_seamless_cube_map"
    case .FragmentShaderInterlock: return "VK_EXT_fragment_shader_interlock"
    case .ShaderSubgroupBallot: return "VK_EXT_shader_subgroup_ballot"
    case .ProvokingVertex: return "VK_EXT_provoking_vertex"
    case .YcbcrImageArrays: return "VK_EXT_ycbcr_image_arrays"
    case .IMGConditionalRenderingComparisonInfo: return "VK_IMG_conditional_rendering_comparison_info"
    case .IMGFormatPvrtc: return "VK_IMG_format_pvrtc"
    case .KHX_ExternalMemoryCapabilities: return "VK_KHX_external_memory_capabilities"
    case .NV_ExternalMemoryWin32: return "VK_NV_external_memory_win32"
    case .IMGFilterCubic: return "VK_IMG_filter_cubic"
    case .SeparateDepthStencilLayouts: return "VK_KHR_separate_depth_stencil_layouts"
    case .ShaderSubgroupVote: return "VK_EXT_shader_subgroup_vote"
    case .NV_RayTracing: return "VK_NV_ray_tracing"
    case .VALVE_MutableDescriptorType: return "VK_VALVE_mutable_descriptor_type"
    case .ExternalFenceFd: return "VK_KHR_external_fence_fd"
    case .PipelineExecutableProperties: return "VK_KHR_pipeline_executable_properties"
    case .PipelineLibrary: return "VK_KHR_pipeline_library"
    case .NV_XDeviceGeneratedCommands: return "VK_NVX_device_generated_commands"
    case .ValidationCache: return "VK_EXT_validation_cache"
    case .NV_DedicatedAllocationImageAliasing: return "VK_NV_dedicated_allocation_image_aliasing"
    case .AMD_DrawIndirectCount: return "VK_AMD_draw_indirect_count"
    case .PciBusInfo: return "VK_EXT_pci_bus_info"
    case .ShaderNonSemanticInfo: return "VK_KHR_shader_non_semantic_info"
    case .PageableDeviceLocalMemory: return "VK_EXT_pageable_device_local_memory"
    case .PipelineRobustness: return "VK_EXT_pipeline_robustness"
    case .ExternalSemaphore: return "VK_KHR_external_semaphore"
    case .KHR_16bitStorage: return "VK_KHR_16bit_storage"
    case .NV_VideoQueue: return "VK_NV_video_queue"
    case .QCOM_FragmentDensityMapOffset: return "VK_QCOM_fragment_density_map_offset"
    case .DebugUtils: return "VK_EXT_debug_utils"
    case .ColorWriteEnable: return "VK_EXT_color_write_enable"
    case .PrimitivesGeneratedQuery: return "VK_EXT_primitives_generated_query"
    case .ZeroInitializeWorkgroupMemory: return "VK_KHR_zero_initialize_workgroup_memory"
    case .ARMRasterizationOrderAttachmentAccess: return "VK_ARM_rasterization_order_attachment_access"
    case .ImageViewMinLod: return "VK_EXT_image_view_min_lod"
    case .NV_ShaderSubgroupPartitioned: return "VK_NV_shader_subgroup_partitioned"
    case .SharedPresentableImage: return "VK_KHR_shared_presentable_image"
    case .NV_ShadingRateImage: return "VK_NV_shading_rate_image"
    case .PrimitiveTopologyListRestart: return "VK_EXT_primitive_topology_list_restart"
    case .DeferredHostOperations: return "VK_KHR_deferred_host_operations"
    case .NV_SampleMaskOverrideCoverage: return "VK_NV_sample_mask_override_coverage"
    case .QCOM_RenderPassTransform: return "VK_QCOM_render_pass_transform"
    case .NV_ExternalMemoryRdma: return "VK_NV_external_memory_rdma"
    case .INTELPerformanceQuery: return "VK_INTEL_performance_query"
    case .DriverProperties: return "VK_KHR_driver_properties"
    case .ExtendedDynamicState2: return "VK_EXT_extended_dynamic_state2"
    case .NV_ShaderSmBuiltins: return "VK_NV_shader_sm_builtins"
    case .DepthClipControl: return "VK_EXT_depth_clip_control"
    case .NV_ShaderImageFootprint: return "VK_NV_shader_image_footprint"
    case .ShaderFloat16Int8: return "VK_KHR_shader_float16_int8"
    case .AMD_ShaderCoreProperties2: return "VK_AMD_shader_core_properties2"
    case .AMD_DeviceCoherentMemory: return "VK_AMD_device_coherent_memory"
    case .EXT_2dImageview3dImage: return "VK_EXT_2d_imageview_3d_image"
    case .ExternalMemoryDmaBuf: return "VK_EXT_external_memory_dma_buf"
    case .NV_ViewportArray2: return "VK_NV_viewport_array2"
    case .UniformBufferStandardLayout: return "VK_KHR_uniform_buffer_standard_layout"
    case .ANDROIDExternalMemoryAndroidHardwareBuffer: return "VK_ANDROID_external_memory_android_hardware_buffer"
    case .NV_CornerSampledImage: return "VK_NV_corner_sampled_image"
    case .NV_LinearColorAttachment: return "VK_NV_linear_color_attachment"
    case .ShaderFloatControls: return "VK_KHR_shader_float_controls"
    case .AMD_WaveLimits: return "VK_AMD_wave_limits"
    case .NV_DedicatedAllocation: return "VK_NV_dedicated_allocation"
    case .ShaderTerminateInvocation: return "VK_KHR_shader_terminate_invocation"
    case .AMD_GpuShaderInt16: return "VK_AMD_gpu_shader_int16"
    case .Maintenance2: return "VK_KHR_maintenance2"
    case .SeparateStencilUsage: return "VK_EXT_separate_stencil_usage"
    case .FullScreenExclusive: return "VK_EXT_full_screen_exclusive"
    case .AMD_ShaderInfo: return "VK_AMD_shader_info"
    case .AMD_ShaderImageLoadStoreLod: return "VK_AMD_shader_image_load_store_lod"
    case .PostDepthCoverage: return "VK_EXT_post_depth_coverage"
    case .ShaderAtomicFloat2: return "VK_EXT_shader_atomic_float2"
    case .FragmentShadingRate: return "VK_KHR_fragment_shading_rate"
    case .SubgroupSizeControl: return "VK_EXT_subgroup_size_control"
    case .ExternalMemoryHost: return "VK_EXT_external_memory_host"
    case .AMD_ShaderFragmentMask: return "VK_AMD_shader_fragment_mask"
    case .DepthClipEnable: return "VK_EXT_depth_clip_enable"
    case .NV_XMultiviewPerViewAttributes: return "VK_NVX_multiview_per_view_attributes"
    case .VALVE_DescriptorSetHostMapping: return "VK_VALVE_descriptor_set_host_mapping"
    case .SampleLocations: return "VK_EXT_sample_locations"
    case .FragmentDensityMap2: return "VK_EXT_fragment_density_map2"
    case .CreateRenderpass2: return "VK_KHR_create_renderpass2"
    case .KHX_ExternalSemaphore: return "VK_KHX_external_semaphore"
    case .CalibratedTimestamps: return "VK_EXT_calibrated_timestamps"
    case .MetalObjects: return "VK_EXT_metal_objects"
    case .PipelineCreationFeedback: return "VK_EXT_pipeline_creation_feedback"
    case .MESA_QueryTimestamp: return "VK_MESA_query_timestamp"
    case .ConservativeRasterization: return "VK_EXT_conservative_rasterization"
    case .NV_XBinaryImport: return "VK_NVX_binary_import"
    case .NV_GeometryShaderPassthrough: return "VK_NV_geometry_shader_passthrough"
    case .SamplerFilterMinmax: return "VK_EXT_sampler_filter_minmax"
    case .VideoDecodeH265: return "VK_EXT_video_decode_h265"
    case .MVKMoltenvk: return "VK_MVK_moltenvk"
    case .DiscardRectangles: return "VK_EXT_discard_rectangles"
    case .HdrMetadata: return "VK_EXT_hdr_metadata"
    case .DisplayControl: return "VK_EXT_display_control"
    case .Ycbcr2plane444Formats: return "VK_EXT_ycbcr_2plane_444_formats"
    case .ANDROIDNativeBuffer: return "VK_ANDROID_native_buffer"
    case .NV_PresentBarrier: return "VK_NV_present_barrier"
    case .ImageDrmFormatModifier: return "VK_EXT_image_drm_format_modifier"
    case .PhysicalDeviceDrm: return "VK_EXT_physical_device_drm"
    case .KHX_ExternalMemoryWin32: return "VK_KHX_external_memory_win32"
    case .NV_GlslShader: return "VK_NV_glsl_shader"
    case .VulkanMemoryModel: return "VK_KHR_vulkan_memory_model"
    case .AMD_GpuShaderHalfFloatFetch: return "VK_AMD_gpu_shader_half_float_fetch"
    case .NV_FragmentShadingRateEnums: return "VK_NV_fragment_shading_rate_enums"
    case .ExtendedDynamicState: return "VK_EXT_extended_dynamic_state"
    case .Multiview: return "VK_KHR_multiview"
    case .Spirv14: return "VK_KHR_spirv_1_4"
    case .AMD_ShaderEarlyAndLateFragmentTests: return "VK_AMD_shader_early_and_late_fragment_tests"
    case .DepthRangeUnrestricted: return "VK_EXT_depth_range_unrestricted"
    case .DebugReport: return "VK_EXT_debug_report"
    case .SwapchainColorspace: return "VK_EXT_swapchain_colorspace"
    case .InlineUniformBlock: return "VK_EXT_inline_uniform_block"
    case .MultiDraw: return "VK_EXT_multi_draw"
    case .DepthStencilResolve: return "VK_KHR_depth_stencil_resolve"
    case .QCOM_RenderPassStoreOps: return "VK_QCOM_render_pass_store_ops"
    case .KHX_DeviceGroup: return "VK_KHX_device_group"
    case .PushDescriptor: return "VK_KHR_push_descriptor"
    case .NV_DeviceGeneratedCommands: return "VK_NV_device_generated_commands"
    case .CopyCommands2: return "VK_KHR_copy_commands2"
    case .XPortabilitySubset: return "VK_EXTX_portability_subset"
    case .ImageRobustness: return "VK_EXT_image_robustness"
    case .ExternalMemory: return "VK_KHR_external_memory"
    case .AMD_TextureGatherBiasLod: return "VK_AMD_texture_gather_bias_lod"
    case .MemoryPriority: return "VK_EXT_memory_priority"
    case .VideoEncodeQueue: return "VK_KHR_video_encode_queue"
    case .NV_RdmaMemory: return "VK_NV_rdma_memory"
    case .NV_ScissorExclusive: return "VK_NV_scissor_exclusive"
    case .AMD_DisplayNativeHdr: return "VK_AMD_display_native_hdr"
    case .DeviceMemoryReport: return "VK_EXT_device_memory_report"
    case .LoadStoreOpNone: return "VK_EXT_load_store_op_none"
    case .ImageFormatList: return "VK_KHR_image_format_list"
    case .AMD_ShaderBallot: return "VK_AMD_shader_ballot"
    case .ShaderIntegerDotProduct: return "VK_KHR_shader_integer_dot_product"
    case .NV_CudaKernelLaunch: return "VK_NV_cuda_kernel_launch"
    case .SamplerYcbcrConversion: return "VK_KHR_sampler_ycbcr_conversion"
    case .HUAWEIPrerotation: return "VK_HUAWEI_prerotation"
    case .SamplerMirrorClampToEdge: return "VK_KHR_sampler_mirror_clamp_to_edge"
    case .BindMemory2: return "VK_KHR_bind_memory2"
    case .ShaderClock: return "VK_KHR_shader_clock"
    case .GOOGLE_DisplayTiming: return "VK_GOOGLE_display_timing"
    case .BlendOperationAdvanced: return "VK_EXT_blend_operation_advanced"
    case .GlobalPriority: return "VK_KHR_global_priority"
    case .DrawIndirectCount: return "VK_KHR_draw_indirect_count"
    case .VariablePointers: return "VK_KHR_variable_pointers"
    case .PrivateData: return "VK_EXT_private_data"
    case .ShaderDrawParameters: return "VK_KHR_shader_draw_parameters"
    case .Win32Surface: return "VK_KHR_win32_surface"
    case .DedicatedAllocation: return "VK_KHR_dedicated_allocation"
    case .KHX_ExternalSemaphoreFd: return "VK_KHX_external_semaphore_fd"
    case .SwapchainMutableFormat: return "VK_KHR_swapchain_mutable_format"
    case .NV_XRaytracing: return "VK_NVX_raytracing"
    case .NV_XImageViewHandle: return "VK_NVX_image_view_handle"
    case .DescriptorIndexing: return "VK_EXT_descriptor_indexing"
    case .HostQueryReset: return "VK_EXT_host_query_reset"
    case .TimelineSemaphore: return "VK_KHR_timeline_semaphore"
    case .NV_DeviceDiagnosticsConfig: return "VK_NV_device_diagnostics_config"
    case .NV_InheritedViewportScissor: return "VK_NV_inherited_viewport_scissor"
    case .AMD_BufferMarker: return "VK_AMD_buffer_marker"
    case .AMD_ShaderCoreProperties: return "VK_AMD_shader_core_properties"
    case .WorkgroupMemoryExplicitLayout: return "VK_KHR_workgroup_memory_explicit_layout"
    case .NV_XDisplayTiming: return "VK_NVX_display_timing"
    case .ExternalFence: return "VK_KHR_external_fence"
    case .GOOGLE_UserType: return "VK_GOOGLE_user_type"
    case .MVKIosSurface: return "VK_MVK_ios_surface"
    case .ExternalSemaphoreWin32: return "VK_KHR_external_semaphore_win32"
    case .NV_FramebufferMixedSamples: return "VK_NV_framebuffer_mixed_samples"
    case .KHR_8bitStorage: return "VK_KHR_8bit_storage"
    case .AMD_ProgrammableSampleLocations: return "VK_AMD_programmable_sample_locations"
    case .NV_LowLatency: return "VK_NV_low_latency"
  }
  return "Invalid"
}
raw_to_extension :: proc(raw: cstring) -> Extension {
  switch raw {
    case "VK_EXT_shader_viewport_index_layer": return .ShaderViewportIndexLayer
    case "VK_NV_fragment_shader_barycentric": return .NV_FragmentShaderBarycentric
    case "VK_NV_mesh_shader": return .NV_MeshShader
    case "VK_KHR_dynamic_rendering": return .DynamicRendering
    case "VK_EXT_global_priority_query": return .GlobalPriorityQuery
    case "VK_AMD_shader_trinary_minmax": return .AMD_ShaderTrinaryMinmax
    case "VK_EXT_tooling_info": return .ToolingInfo
    case "VK_NV_compute_shader_derivatives": return .NV_ComputeShaderDerivatives
    case "VK_AMD_rasterization_order": return .AMD_RasterizationOrder
    case "VK_AMD_image_layout_resolve": return .AMD_ImageLayoutResolve
    case "VK_KHR_relaxed_block_layout": return .RelaxedBlockLayout
    case "VK_EXT_conditional_rendering": return .ConditionalRendering
    case "VK_EXT_astc_decode_mode": return .AstcDecodeMode
    case "VK_EXT_index_type_uint8": return .IndexTypeUint8
    case "VK_NV_texture_dirty_tile_map": return .NV_TextureDirtyTileMap
    case "VK_KHR_ray_tracing_pipeline": return .RayTracingPipeline
    case "VK_KHR_storage_buffer_storage_class": return .StorageBufferStorageClass
    case "VK_KHR_incremental_present": return .IncrementalPresent
    case "VK_NV_cooperative_matrix": return .NV_CooperativeMatrix
    case "VK_KHR_ray_tracing_maintenance1": return .RayTracingMaintenance1
    case "VK_KHR_format_feature_flags2": return .FormatFeatureFlags2
    case "VK_KHR_descriptor_update_template": return .DescriptorUpdateTemplate
    case "VK_QCOM_render_pass_shader_resolve": return .QCOM_RenderPassShaderResolve
    case "VK_AMD_mixed_attachment_samples": return .AMD_MixedAttachmentSamples
    case "VK_KHR_maintenance1": return .Maintenance1
    case "VK_EXT_image_2d_view_of_3d": return .Image2dViewOf3d
    case "VK_GOOGLE_decorate_string": return .GOOGLE_DecorateString
    case "VK_QCOM_rotated_copy_commands": return .QCOM_RotatedCopyCommands
    case "VK_EXT_robustness2": return .Robustness2
    case "VK_KHR_portability_subset": return .PortabilitySubset
    case "VK_EXT_transform_feedback": return .TransformFeedback
    case "VK_GOOGLE_sampler_filtering_precision": return .GOOGLE_SamplerFilteringPrecision
    case "VK_AMD_gcn_shader": return .AMD_GcnShader
    case "VK_EXT_pipeline_creation_cache_control": return .PipelineCreationCacheControl
    case "VK_NV_acquire_winrt_display": return .NV_AcquireWinrtDisplay
    case "VK_KHR_swapchain": return .Swapchain
    case "VK_KHR_performance_query": return .PerformanceQuery
    case "VK_KHR_ray_query": return .RayQuery
    case "VK_Invalid": return .Invalid
    case "VK_NV_ray_tracing_motion_blur": return .NV_RayTracingMotionBlur
    case "VK_AMD_gpa_interface": return .AMD_GpaInterface
    case "VK_NV_representative_fragment_test": return .NV_RepresentativeFragmentTest
    case "VK_KHR_device_group": return .DeviceGroup
    case "VK_KHX_external_semaphore_win32": return .KHX_ExternalSemaphoreWin32
    case "VK_KHR_video_decode_queue": return .VideoDecodeQueue
    case "VK_EXT_shader_module_identifier": return .ShaderModuleIdentifier
    case "VK_NV_device_diagnostic_checkpoints": return .NV_DeviceDiagnosticCheckpoints
    case "VK_AMD_pipeline_compiler_control": return .AMD_PipelineCompilerControl
    case "VK_KHR_shader_subgroup_uniform_control_flow": return .ShaderSubgroupUniformControlFlow
    case "VK_EXT_video_encode_h264": return .VideoEncodeH264
    case "VK_EXT_scalar_block_layout": return .ScalarBlockLayout
    case "VK_KHR_maintenance4": return .Maintenance4
    case "VK_NV_fragment_coverage_to_color": return .NV_FragmentCoverageToColor
    case "VK_NV_win32_keyed_mutex": return .NV_Win32KeyedMutex
    case "VK_EXT_shader_demote_to_helper_invocation": return .ShaderDemoteToHelperInvocation
    case "VK_KHR_external_memory_win32": return .ExternalMemoryWin32
    case "VK_KHR_win32_keyed_mutex": return .Win32KeyedMutex
    case "VK_NV_fill_rectangle": return .NV_FillRectangle
    case "VK_KHR_xcb_surface": return .XcbSurface
    case "VK_KHR_acceleration_structure": return .AccelerationStructure
    case "VK_KHR_external_fence_win32": return .ExternalFenceWin32
    case "VK_KHR_maintenance3": return .Maintenance3
    case "VK_KHR_external_semaphore_fd": return .ExternalSemaphoreFd
    case "VK_MVK_macos_surface": return .MVKMacosSurface
    case "VK_EXT_memory_budget": return .MemoryBudget
    case "VK_AMD_shader_explicit_vertex_parameter": return .AMD_ShaderExplicitVertexParameter
    case "VK_EXT_custom_border_color": return .CustomBorderColor
    case "VK_EXT_filter_cubic": return .FilterCubic
    case "VK_EXT_debug_marker": return .DebugMarker
    case "VK_KHR_get_physical_device_properties2": return .GetPhysicalDeviceProperties2
    case "VK_KHX_external_memory_fd": return .KHX_ExternalMemoryFd
    case "VK_KHR_display_swapchain": return .DisplaySwapchain
    case "VK_HUAWEI_smart_cache": return .HUAWEISmartCache
    case "VK_INTEL_shader_integer_functions2": return .INTELShaderIntegerFunctions2
    case "VK_KHX_win32_keyed_mutex": return .KHX_Win32KeyedMutex
    case "VK_NV_external_memory": return .NV_ExternalMemory
    case "VK_KHR_present_id": return .PresentId
    case "VK_KHX_multiview": return .KHX_Multiview
    case "VK_KHR_surface": return .Surface
    case "VK_EXT_texel_buffer_alignment": return .TexelBufferAlignment
    case "VK_EXT_vertex_input_dynamic_state": return .VertexInputDynamicState
    case "VK_KHR_shader_subgroup_extended_types": return .ShaderSubgroupExtendedTypes
    case "VK_KHR_video_queue": return .VideoQueue
    case "VK_EXT_rgba10x6_formats": return .Rgba10x6Formats
    case "VK_EXT_video_decode_h264": return .VideoDecodeH264
    case "VK_NVX_image_clear_padding": return .NV_XImageClearPadding
    case "VK_EXT_line_rasterization": return .LineRasterization
    case "VK_KHR_present_wait": return .PresentWait
    case "VK_EXT_fragment_density_map": return .FragmentDensityMap
    case "VK_KHR_external_memory_fd": return .ExternalMemoryFd
    case "VK_NV_viewport_swizzle": return .NV_ViewportSwizzle
    case "VK_EXT_texture_compression_astc_hdr": return .TextureCompressionAstcHdr
    case "VK_EXT_border_color_swizzle": return .BorderColorSwizzle
    case "VK_KHR_buffer_device_address": return .BufferDeviceAddress
    case "VK_AMD_memory_overallocation_behavior": return .AMD_MemoryOverallocationBehavior
    case "VK_KHR_get_memory_requirements2": return .GetMemoryRequirements2
    case "VK_EXT_graphics_pipeline_library": return .GraphicsPipelineLibrary
    case "VK_AMD_gpu_shader_half_float": return .AMD_GpuShaderHalfFloat
    case "VK_EXT_shader_atomic_float": return .ShaderAtomicFloat
    case "VK_KHR_synchronization2": return .Synchronization2
    case "VK_EXT_4444_formats": return .EXT_4444Formats
    case "VK_NV_device_debug_checkpoints": return .NV_DeviceDebugCheckpoints
    case "VK_EXT_shader_stencil_export": return .ShaderStencilExport
    case "VK_EXT_shader_image_atomic_int64": return .ShaderImageAtomicInt64
    case "VK_KHR_fragment_shader_barycentric": return .FragmentShaderBarycentric
    case "VK_KHR_imageless_framebuffer": return .ImagelessFramebuffer
    case "VK_NV_coverage_reduction_mode": return .NV_CoverageReductionMode
    case "VK_KHX_external_memory": return .KHX_ExternalMemory
    case "VK_KHR_ray_tracing": return .RayTracing
    case "VK_NV_clip_space_w_scaling": return .NV_ClipSpaceWScaling
    case "VK_GOOGLE_hlsl_functionality1": return .GOOGLE_HlslFunctionality1
    case "VK_AMD_calibrated_timestamps": return .AMD_CalibratedTimestamps
    case "VK_AMD_negative_viewport_height": return .AMD_NegativeViewportHeight
    case "VK_EXT_queue_family_foreign": return .QueueFamilyForeign
    case "VK_EXT_vertex_attribute_divisor": return .VertexAttributeDivisor
    case "VK_KHR_shader_atomic_int64": return .ShaderAtomicInt64
    case "VK_EXT_non_seamless_cube_map": return .NonSeamlessCubeMap
    case "VK_EXT_fragment_shader_interlock": return .FragmentShaderInterlock
    case "VK_EXT_shader_subgroup_ballot": return .ShaderSubgroupBallot
    case "VK_EXT_provoking_vertex": return .ProvokingVertex
    case "VK_EXT_ycbcr_image_arrays": return .YcbcrImageArrays
    case "VK_IMG_conditional_rendering_comparison_info": return .IMGConditionalRenderingComparisonInfo
    case "VK_IMG_format_pvrtc": return .IMGFormatPvrtc
    case "VK_KHX_external_memory_capabilities": return .KHX_ExternalMemoryCapabilities
    case "VK_NV_external_memory_win32": return .NV_ExternalMemoryWin32
    case "VK_IMG_filter_cubic": return .IMGFilterCubic
    case "VK_KHR_separate_depth_stencil_layouts": return .SeparateDepthStencilLayouts
    case "VK_EXT_shader_subgroup_vote": return .ShaderSubgroupVote
    case "VK_NV_ray_tracing": return .NV_RayTracing
    case "VK_VALVE_mutable_descriptor_type": return .VALVE_MutableDescriptorType
    case "VK_KHR_external_fence_fd": return .ExternalFenceFd
    case "VK_KHR_pipeline_executable_properties": return .PipelineExecutableProperties
    case "VK_KHR_pipeline_library": return .PipelineLibrary
    case "VK_NVX_device_generated_commands": return .NV_XDeviceGeneratedCommands
    case "VK_EXT_validation_cache": return .ValidationCache
    case "VK_NV_dedicated_allocation_image_aliasing": return .NV_DedicatedAllocationImageAliasing
    case "VK_AMD_draw_indirect_count": return .AMD_DrawIndirectCount
    case "VK_EXT_pci_bus_info": return .PciBusInfo
    case "VK_KHR_shader_non_semantic_info": return .ShaderNonSemanticInfo
    case "VK_EXT_pageable_device_local_memory": return .PageableDeviceLocalMemory
    case "VK_EXT_pipeline_robustness": return .PipelineRobustness
    case "VK_KHR_external_semaphore": return .ExternalSemaphore
    case "VK_KHR_16bit_storage": return .KHR_16bitStorage
    case "VK_NV_video_queue": return .NV_VideoQueue
    case "VK_QCOM_fragment_density_map_offset": return .QCOM_FragmentDensityMapOffset
    case "VK_EXT_debug_utils": return .DebugUtils
    case "VK_EXT_color_write_enable": return .ColorWriteEnable
    case "VK_EXT_primitives_generated_query": return .PrimitivesGeneratedQuery
    case "VK_KHR_zero_initialize_workgroup_memory": return .ZeroInitializeWorkgroupMemory
    case "VK_ARM_rasterization_order_attachment_access": return .ARMRasterizationOrderAttachmentAccess
    case "VK_EXT_image_view_min_lod": return .ImageViewMinLod
    case "VK_NV_shader_subgroup_partitioned": return .NV_ShaderSubgroupPartitioned
    case "VK_KHR_shared_presentable_image": return .SharedPresentableImage
    case "VK_NV_shading_rate_image": return .NV_ShadingRateImage
    case "VK_EXT_primitive_topology_list_restart": return .PrimitiveTopologyListRestart
    case "VK_KHR_deferred_host_operations": return .DeferredHostOperations
    case "VK_NV_sample_mask_override_coverage": return .NV_SampleMaskOverrideCoverage
    case "VK_QCOM_render_pass_transform": return .QCOM_RenderPassTransform
    case "VK_NV_external_memory_rdma": return .NV_ExternalMemoryRdma
    case "VK_INTEL_performance_query": return .INTELPerformanceQuery
    case "VK_KHR_driver_properties": return .DriverProperties
    case "VK_EXT_extended_dynamic_state2": return .ExtendedDynamicState2
    case "VK_NV_shader_sm_builtins": return .NV_ShaderSmBuiltins
    case "VK_EXT_depth_clip_control": return .DepthClipControl
    case "VK_NV_shader_image_footprint": return .NV_ShaderImageFootprint
    case "VK_KHR_shader_float16_int8": return .ShaderFloat16Int8
    case "VK_AMD_shader_core_properties2": return .AMD_ShaderCoreProperties2
    case "VK_AMD_device_coherent_memory": return .AMD_DeviceCoherentMemory
    case "VK_EXT_2d_imageview_3d_image": return .EXT_2dImageview3dImage
    case "VK_EXT_external_memory_dma_buf": return .ExternalMemoryDmaBuf
    case "VK_NV_viewport_array2": return .NV_ViewportArray2
    case "VK_KHR_uniform_buffer_standard_layout": return .UniformBufferStandardLayout
    case "VK_ANDROID_external_memory_android_hardware_buffer": return .ANDROIDExternalMemoryAndroidHardwareBuffer
    case "VK_NV_corner_sampled_image": return .NV_CornerSampledImage
    case "VK_NV_linear_color_attachment": return .NV_LinearColorAttachment
    case "VK_KHR_shader_float_controls": return .ShaderFloatControls
    case "VK_AMD_wave_limits": return .AMD_WaveLimits
    case "VK_NV_dedicated_allocation": return .NV_DedicatedAllocation
    case "VK_KHR_shader_terminate_invocation": return .ShaderTerminateInvocation
    case "VK_AMD_gpu_shader_int16": return .AMD_GpuShaderInt16
    case "VK_KHR_maintenance2": return .Maintenance2
    case "VK_EXT_separate_stencil_usage": return .SeparateStencilUsage
    case "VK_EXT_full_screen_exclusive": return .FullScreenExclusive
    case "VK_AMD_shader_info": return .AMD_ShaderInfo
    case "VK_AMD_shader_image_load_store_lod": return .AMD_ShaderImageLoadStoreLod
    case "VK_EXT_post_depth_coverage": return .PostDepthCoverage
    case "VK_EXT_shader_atomic_float2": return .ShaderAtomicFloat2
    case "VK_KHR_fragment_shading_rate": return .FragmentShadingRate
    case "VK_EXT_subgroup_size_control": return .SubgroupSizeControl
    case "VK_EXT_external_memory_host": return .ExternalMemoryHost
    case "VK_AMD_shader_fragment_mask": return .AMD_ShaderFragmentMask
    case "VK_EXT_depth_clip_enable": return .DepthClipEnable
    case "VK_NVX_multiview_per_view_attributes": return .NV_XMultiviewPerViewAttributes
    case "VK_VALVE_descriptor_set_host_mapping": return .VALVE_DescriptorSetHostMapping
    case "VK_EXT_sample_locations": return .SampleLocations
    case "VK_EXT_fragment_density_map2": return .FragmentDensityMap2
    case "VK_KHR_create_renderpass2": return .CreateRenderpass2
    case "VK_KHX_external_semaphore": return .KHX_ExternalSemaphore
    case "VK_EXT_calibrated_timestamps": return .CalibratedTimestamps
    case "VK_EXT_metal_objects": return .MetalObjects
    case "VK_EXT_pipeline_creation_feedback": return .PipelineCreationFeedback
    case "VK_MESA_query_timestamp": return .MESA_QueryTimestamp
    case "VK_EXT_conservative_rasterization": return .ConservativeRasterization
    case "VK_NVX_binary_import": return .NV_XBinaryImport
    case "VK_NV_geometry_shader_passthrough": return .NV_GeometryShaderPassthrough
    case "VK_EXT_sampler_filter_minmax": return .SamplerFilterMinmax
    case "VK_EXT_video_decode_h265": return .VideoDecodeH265
    case "VK_MVK_moltenvk": return .MVKMoltenvk
    case "VK_EXT_discard_rectangles": return .DiscardRectangles
    case "VK_EXT_hdr_metadata": return .HdrMetadata
    case "VK_EXT_display_control": return .DisplayControl
    case "VK_EXT_ycbcr_2plane_444_formats": return .Ycbcr2plane444Formats
    case "VK_ANDROID_native_buffer": return .ANDROIDNativeBuffer
    case "VK_NV_present_barrier": return .NV_PresentBarrier
    case "VK_EXT_image_drm_format_modifier": return .ImageDrmFormatModifier
    case "VK_EXT_physical_device_drm": return .PhysicalDeviceDrm
    case "VK_KHX_external_memory_win32": return .KHX_ExternalMemoryWin32
    case "VK_NV_glsl_shader": return .NV_GlslShader
    case "VK_KHR_vulkan_memory_model": return .VulkanMemoryModel
    case "VK_AMD_gpu_shader_half_float_fetch": return .AMD_GpuShaderHalfFloatFetch
    case "VK_NV_fragment_shading_rate_enums": return .NV_FragmentShadingRateEnums
    case "VK_EXT_extended_dynamic_state": return .ExtendedDynamicState
    case "VK_KHR_multiview": return .Multiview
    case "VK_KHR_spirv_1_4": return .Spirv14
    case "VK_AMD_shader_early_and_late_fragment_tests": return .AMD_ShaderEarlyAndLateFragmentTests
    case "VK_EXT_depth_range_unrestricted": return .DepthRangeUnrestricted
    case "VK_EXT_debug_report": return .DebugReport
    case "VK_EXT_swapchain_colorspace": return .SwapchainColorspace
    case "VK_EXT_inline_uniform_block": return .InlineUniformBlock
    case "VK_EXT_multi_draw": return .MultiDraw
    case "VK_KHR_depth_stencil_resolve": return .DepthStencilResolve
    case "VK_QCOM_render_pass_store_ops": return .QCOM_RenderPassStoreOps
    case "VK_KHX_device_group": return .KHX_DeviceGroup
    case "VK_KHR_push_descriptor": return .PushDescriptor
    case "VK_NV_device_generated_commands": return .NV_DeviceGeneratedCommands
    case "VK_KHR_copy_commands2": return .CopyCommands2
    case "VK_EXTX_portability_subset": return .XPortabilitySubset
    case "VK_EXT_image_robustness": return .ImageRobustness
    case "VK_KHR_external_memory": return .ExternalMemory
    case "VK_AMD_texture_gather_bias_lod": return .AMD_TextureGatherBiasLod
    case "VK_EXT_memory_priority": return .MemoryPriority
    case "VK_KHR_video_encode_queue": return .VideoEncodeQueue
    case "VK_NV_rdma_memory": return .NV_RdmaMemory
    case "VK_NV_scissor_exclusive": return .NV_ScissorExclusive
    case "VK_AMD_display_native_hdr": return .AMD_DisplayNativeHdr
    case "VK_EXT_device_memory_report": return .DeviceMemoryReport
    case "VK_EXT_load_store_op_none": return .LoadStoreOpNone
    case "VK_KHR_image_format_list": return .ImageFormatList
    case "VK_AMD_shader_ballot": return .AMD_ShaderBallot
    case "VK_KHR_shader_integer_dot_product": return .ShaderIntegerDotProduct
    case "VK_NV_cuda_kernel_launch": return .NV_CudaKernelLaunch
    case "VK_KHR_sampler_ycbcr_conversion": return .SamplerYcbcrConversion
    case "VK_HUAWEI_prerotation": return .HUAWEIPrerotation
    case "VK_KHR_sampler_mirror_clamp_to_edge": return .SamplerMirrorClampToEdge
    case "VK_KHR_bind_memory2": return .BindMemory2
    case "VK_KHR_shader_clock": return .ShaderClock
    case "VK_GOOGLE_display_timing": return .GOOGLE_DisplayTiming
    case "VK_EXT_blend_operation_advanced": return .BlendOperationAdvanced
    case "VK_KHR_global_priority": return .GlobalPriority
    case "VK_KHR_draw_indirect_count": return .DrawIndirectCount
    case "VK_KHR_variable_pointers": return .VariablePointers
    case "VK_EXT_private_data": return .PrivateData
    case "VK_KHR_shader_draw_parameters": return .ShaderDrawParameters
    case "VK_KHR_win32_surface": return .Win32Surface
    case "VK_KHR_dedicated_allocation": return .DedicatedAllocation
    case "VK_KHX_external_semaphore_fd": return .KHX_ExternalSemaphoreFd
    case "VK_KHR_swapchain_mutable_format": return .SwapchainMutableFormat
    case "VK_NVX_raytracing": return .NV_XRaytracing
    case "VK_NVX_image_view_handle": return .NV_XImageViewHandle
    case "VK_EXT_descriptor_indexing": return .DescriptorIndexing
    case "VK_EXT_host_query_reset": return .HostQueryReset
    case "VK_KHR_timeline_semaphore": return .TimelineSemaphore
    case "VK_NV_device_diagnostics_config": return .NV_DeviceDiagnosticsConfig
    case "VK_NV_inherited_viewport_scissor": return .NV_InheritedViewportScissor
    case "VK_AMD_buffer_marker": return .AMD_BufferMarker
    case "VK_AMD_shader_core_properties": return .AMD_ShaderCoreProperties
    case "VK_KHR_workgroup_memory_explicit_layout": return .WorkgroupMemoryExplicitLayout
    case "VK_NVX_display_timing": return .NV_XDisplayTiming
    case "VK_KHR_external_fence": return .ExternalFence
    case "VK_GOOGLE_user_type": return .GOOGLE_UserType
    case "VK_MVK_ios_surface": return .MVKIosSurface
    case "VK_KHR_external_semaphore_win32": return .ExternalSemaphoreWin32
    case "VK_NV_framebuffer_mixed_samples": return .NV_FramebufferMixedSamples
    case "VK_KHR_8bit_storage": return .KHR_8bitStorage
    case "VK_AMD_programmable_sample_locations": return .AMD_ProgrammableSampleLocations
    case "VK_NV_low_latency": return .NV_LowLatency
  }
  return .Invalid 
}
