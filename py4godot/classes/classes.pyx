cimport py4godot.classes.generated as c_generated
import py4godot.classes.generated as py_generated
import py4godot.classes.convert as convert
from py4godot.utils.Wrapper cimport *
from py4godot.godot_bindings.binding cimport *
from py4godot.godot_bindings.binding_external cimport *
from py4godot.godot_bindings.types cimport *


cdef api init_method_bindings(godot_gdnative_core_api_struct* core):
    py_generated.init_method_bindings()

cdef api set_bindings_funcs(godot_instance_binding_functions bindings_funcs_, int lang_ind):
    c_generated.set_bindings_funcs(bindings_funcs_, lang_ind)

cdef api register_types():
    c_generated.register_types()

cdef api get_init_convert():
    dict_convert = {
    'MobileVRInterface':py_generated.MobileVRInterface,
    'MarginContainer':py_generated.MarginContainer,
    'Animation':py_generated.Animation,
    'InputEventMouse':py_generated.InputEventMouse,
    'WebSocketServer':py_generated.WebSocketServer,
    'Separator':py_generated.Separator,
    'PrimitiveMesh':py_generated.PrimitiveMesh,
    'Physics2DDirectBodyState':py_generated.Physics2DDirectBodyState,
    'CanvasModulate':py_generated.CanvasModulate,
    'VisualShaderNodeScalarUniform':py_generated.VisualShaderNodeScalarUniform,
    'CylinderMesh':py_generated.CylinderMesh,
    'Shape2D':py_generated.Shape2D,
    'MeshInstance':py_generated.MeshInstance,
    'RemoteTransform':py_generated.RemoteTransform,
    'VisualShaderNodeCompare':py_generated.VisualShaderNodeCompare,
    'VisualShaderNodeUniformRef':py_generated.VisualShaderNodeUniformRef,
    'VisualScriptFunctionCall':py_generated.VisualScriptFunctionCall,
    'NavigationMesh':py_generated.NavigationMesh,
    'GLTFSkeleton':py_generated.GLTFSkeleton,
    'VisibilityNotifier2D':py_generated.VisibilityNotifier2D,
    'CameraFeed':py_generated.CameraFeed,
    '_Directory':py_generated._Directory,
    'OccluderShapeSphere':py_generated.OccluderShapeSphere,
    'ConeTwistJoint':py_generated.ConeTwistJoint,
    'TileMap':py_generated.TileMap,
    'Reference':py_generated.Reference,
    'CubeMesh':py_generated.CubeMesh,
    'InputEventGesture':py_generated.InputEventGesture,
    'SkeletonIK':py_generated.SkeletonIK,
    'EditorResourcePreview':py_generated.EditorResourcePreview,
    'VisualScriptExpression':py_generated.VisualScriptExpression,
    'EditorFileSystem':py_generated.EditorFileSystem,
    'PanoramaSky':py_generated.PanoramaSky,
    'VisualShaderNodeVectorCompose':py_generated.VisualShaderNodeVectorCompose,
    'ConcavePolygonShape2D':py_generated.ConcavePolygonShape2D,
    'Slider':py_generated.Slider,
    'CSGSphere':py_generated.CSGSphere,
    'CapsuleShape2D':py_generated.CapsuleShape2D,
    'CubeMap':py_generated.CubeMap,
    'AudioEffectNotchFilter':py_generated.AudioEffectNotchFilter,
    'RichTextEffect':py_generated.RichTextEffect,
    'Texture':py_generated.Texture,
    'ColorPickerButton':py_generated.ColorPickerButton,
    'EditorVCSInterface':py_generated.EditorVCSInterface,
    'JSONRPC':py_generated.JSONRPC,
    'VisualShaderNodeScalarSmoothStep':py_generated.VisualShaderNodeScalarSmoothStep,
    'AudioEffectStereoEnhance':py_generated.AudioEffectStereoEnhance,
    'AudioEffectPanner':py_generated.AudioEffectPanner,
    'VisualScriptNode':py_generated.VisualScriptNode,
    'ItemList':py_generated.ItemList,
    'Particles':py_generated.Particles,
    'VisualShaderNodeTransformMult':py_generated.VisualShaderNodeTransformMult,
    'PointMesh':py_generated.PointMesh,
    'Shape':py_generated.Shape,
    'VisualScriptPropertySet':py_generated.VisualScriptPropertySet,
    'PackedDataContainer':py_generated.PackedDataContainer,
    'VisualScriptClassConstant':py_generated.VisualScriptClassConstant,
    'ProceduralSky':py_generated.ProceduralSky,
    'BitMap':py_generated.BitMap,
    'VisualShaderNodeIf':py_generated.VisualShaderNodeIf,
    'Viewport':py_generated.Viewport,
    'AnimationNodeOutput':py_generated.AnimationNodeOutput,
    'CPUParticles':py_generated.CPUParticles,
    'ProgressBar':py_generated.ProgressBar,
    'RoomGroup':py_generated.RoomGroup,
    'PhysicsBody2D':py_generated.PhysicsBody2D,
    'VisualScriptIndexSet':py_generated.VisualScriptIndexSet,
    'ConfigFile':py_generated.ConfigFile,
    'IP':py_generated.IP,
    'RectangleShape2D':py_generated.RectangleShape2D,
    'VisualShaderNodeColorConstant':py_generated.VisualShaderNodeColorConstant,
    'ImageTexture':py_generated.ImageTexture,
    'Button':py_generated.Button,
    'CollisionPolygon2D':py_generated.CollisionPolygon2D,
    'PathFollow2D':py_generated.PathFollow2D,
    'Light':py_generated.Light,
    'StaticBody2D':py_generated.StaticBody2D,
    'AudioStreamPlayer2D':py_generated.AudioStreamPlayer2D,
    'ViewportContainer':py_generated.ViewportContainer,
    'VisualShaderNodeVectorInterp':py_generated.VisualShaderNodeVectorInterp,
    'GLTFSpecGloss':py_generated.GLTFSpecGloss,
    'PhysicsTestMotionResult':py_generated.PhysicsTestMotionResult,
    'SpinBox':py_generated.SpinBox,
    'BitmapFont':py_generated.BitmapFont,
    'Translation':py_generated.Translation,
    '_Mutex':py_generated._Mutex,
    'AudioEffectSpectrumAnalyzer':py_generated.AudioEffectSpectrumAnalyzer,
    'PhysicsDirectSpaceState':py_generated.PhysicsDirectSpaceState,
    'SegmentShape2D':py_generated.SegmentShape2D,
    '_ResourceSaver':py_generated._ResourceSaver,
    'TextureArray':py_generated.TextureArray,
    'InstancePlaceholder':py_generated.InstancePlaceholder,
    'MultiMeshInstance2D':py_generated.MultiMeshInstance2D,
    'Node2D':py_generated.Node2D,
    'TextureLayered':py_generated.TextureLayered,
    'StreamPeer':py_generated.StreamPeer,
    'VisualShaderNodeScalarDerivativeFunc':py_generated.VisualShaderNodeScalarDerivativeFunc,
    'EditorExportPlugin':py_generated.EditorExportPlugin,
    'HTTPClient':py_generated.HTTPClient,
    'ResourcePreloader':py_generated.ResourcePreloader,
    'VisualShaderNodeDotProduct':py_generated.VisualShaderNodeDotProduct,
    'WebRTCDataChannel':py_generated.WebRTCDataChannel,
    'CPUParticles2D':py_generated.CPUParticles2D,
    'Physics2DShapeQueryParameters':py_generated.Physics2DShapeQueryParameters,
    'StyleBoxFlat':py_generated.StyleBoxFlat,
    'ARVRPositionalTracker':py_generated.ARVRPositionalTracker,
    'VisualScriptYield':py_generated.VisualScriptYield,
    'BakedLightmap':py_generated.BakedLightmap,
    'VisualShaderNodeTransformDecompose':py_generated.VisualShaderNodeTransformDecompose,
    'GradientTexture':py_generated.GradientTexture,
    'AudioStreamMP3':py_generated.AudioStreamMP3,
    'ARVRInterface':py_generated.ARVRInterface,
    'EditorInspectorPlugin':py_generated.EditorInspectorPlugin,
    'ARVRController':py_generated.ARVRController,
    'ExternalTexture':py_generated.ExternalTexture,
    'GLTFState':py_generated.GLTFState,
    'Gradient':py_generated.Gradient,
    'ResourceFormatLoader':py_generated.ResourceFormatLoader,
    'StreamPeerGDNative':py_generated.StreamPeerGDNative,
    'GIProbe':py_generated.GIProbe,
    'CapsuleMesh':py_generated.CapsuleMesh,
    'VisualScriptConstructor':py_generated.VisualScriptConstructor,
    'Position3D':py_generated.Position3D,
    'PlaneMesh':py_generated.PlaneMesh,
    'Control':py_generated.Control,
    'AnimationNodeStateMachine':py_generated.AnimationNodeStateMachine,
    'RichTextLabel':py_generated.RichTextLabel,
    'VisualScriptComposeArray':py_generated.VisualScriptComposeArray,
    'NavigationPolygonInstance':py_generated.NavigationPolygonInstance,
    'Object':py_generated.Object,
    'CSGBox':py_generated.CSGBox,
    'ProximityGroup':py_generated.ProximityGroup,
    'PopupMenu':py_generated.PopupMenu,
    'InputEventPanGesture':py_generated.InputEventPanGesture,
    'StyleBoxLine':py_generated.StyleBoxLine,
    'GLTFDocument':py_generated.GLTFDocument,
    'RootMotionView':py_generated.RootMotionView,
    'VideoPlayer':py_generated.VideoPlayer,
    'VisualShaderNodeScalarClamp':py_generated.VisualShaderNodeScalarClamp,
    'KinematicCollision2D':py_generated.KinematicCollision2D,
    'AnimatedSprite3D':py_generated.AnimatedSprite3D,
    'PhysicsDirectBodyState':py_generated.PhysicsDirectBodyState,
    'HashingContext':py_generated.HashingContext,
    'WorldEnvironment':py_generated.WorldEnvironment,
    'KinematicBody2D':py_generated.KinematicBody2D,
    'AudioEffectRecord':py_generated.AudioEffectRecord,
    'VisualShaderNodeVectorDecompose':py_generated.VisualShaderNodeVectorDecompose,
    'EditorSpinSlider':py_generated.EditorSpinSlider,
    'VisualShaderNodeColorUniform':py_generated.VisualShaderNodeColorUniform,
    'AudioEffectEQ6':py_generated.AudioEffectEQ6,
    'LargeTexture':py_generated.LargeTexture,
    'EditorResourcePreviewGenerator':py_generated.EditorResourcePreviewGenerator,
    'PacketPeerGDNative':py_generated.PacketPeerGDNative,
    'GIProbeData':py_generated.GIProbeData,
    'CharFXTransform':py_generated.CharFXTransform,
    'EditorSceneImporterFBX':py_generated.EditorSceneImporterFBX,
    'EditorFeatureProfile':py_generated.EditorFeatureProfile,
    'JNISingleton':py_generated.JNISingleton,
    'Skin':py_generated.Skin,
    'InputEventJoypadMotion':py_generated.InputEventJoypadMotion,
    'LineEdit':py_generated.LineEdit,
    'ResourceImporter':py_generated.ResourceImporter,
    'EditorSceneImporter':py_generated.EditorSceneImporter,
    'AnimationNodeBlendSpace1D':py_generated.AnimationNodeBlendSpace1D,
    'VisualShaderNodeInput':py_generated.VisualShaderNodeInput,
    'Curve3D':py_generated.Curve3D,
    'Resource':py_generated.Resource,
    'InputEventMIDI':py_generated.InputEventMIDI,
    'PopupPanel':py_generated.PopupPanel,
    'WeakRef':py_generated.WeakRef,
    'CheckButton':py_generated.CheckButton,
    'RayCast2D':py_generated.RayCast2D,
    'Skeleton':py_generated.Skeleton,
    'PacketPeer':py_generated.PacketPeer,
    'CSGCombiner':py_generated.CSGCombiner,
    'QuadMesh':py_generated.QuadMesh,
    'TextureRect':py_generated.TextureRect,
    'VisualShaderNodeVectorDistance':py_generated.VisualShaderNodeVectorDistance,
    'EditorSelection':py_generated.EditorSelection,
    'VisualScriptComment':py_generated.VisualScriptComment,
    'BulletPhysicsServer':py_generated.BulletPhysicsServer,
    'PackedSceneGLTF':py_generated.PackedSceneGLTF,
    'DirectionalLight':py_generated.DirectionalLight,
    'GLTFCamera':py_generated.GLTFCamera,
    'Listener':py_generated.Listener,
    'VBoxContainer':py_generated.VBoxContainer,
    'PinJoint':py_generated.PinJoint,
    'GLTFAccessor':py_generated.GLTFAccessor,
    'VisualShaderNodeFresnel':py_generated.VisualShaderNodeFresnel,
    'PacketPeerDTLS':py_generated.PacketPeerDTLS,
    'Popup':py_generated.Popup,
    'Mesh':py_generated.Mesh,
    'InputEvent':py_generated.InputEvent,
    'GDScript':py_generated.GDScript,
    'NoiseTexture':py_generated.NoiseTexture,
    'StreamPeerTCP':py_generated.StreamPeerTCP,
    'OptionButton':py_generated.OptionButton,
    'AudioEffectEQ':py_generated.AudioEffectEQ,
    'ImmediateGeometry':py_generated.ImmediateGeometry,
    'Area2D':py_generated.Area2D,
    'CanvasItem':py_generated.CanvasItem,
    'ToolButton':py_generated.ToolButton,
    'VScrollBar':py_generated.VScrollBar,
    'ARVROrigin':py_generated.ARVROrigin,
    'AnimationNodeOneShot':py_generated.AnimationNodeOneShot,
    'Shader':py_generated.Shader,
    'VisualScriptLists':py_generated.VisualScriptLists,
    'GDNativeLibrary':py_generated.GDNativeLibrary,
    'VisualShaderNodeVectorOp':py_generated.VisualShaderNodeVectorOp,
    'CollisionShape2D':py_generated.CollisionShape2D,
    'VisualScriptFunctionState':py_generated.VisualScriptFunctionState,
    'InputEventJoypadButton':py_generated.InputEventJoypadButton,
    'GLTFSkin':py_generated.GLTFSkin,
    'FuncRef':py_generated.FuncRef,
    'VisualScriptBuiltinFunc':py_generated.VisualScriptBuiltinFunc,
    'Line2D':py_generated.Line2D,
    'VisualShaderNodeOutput':py_generated.VisualShaderNodeOutput,
    'EditorScenePostImport':py_generated.EditorScenePostImport,
    'Generic6DOFJoint':py_generated.Generic6DOFJoint,
    'TextFile':py_generated.TextFile,
    'VisualShaderNodeScalarFunc':py_generated.VisualShaderNodeScalarFunc,
    'VisualShaderNodeVec3Constant':py_generated.VisualShaderNodeVec3Constant,
    '_Geometry':py_generated._Geometry,
    'VisualShaderNodeVectorDerivativeFunc':py_generated.VisualShaderNodeVectorDerivativeFunc,
    'VisualScriptSceneNode':py_generated.VisualScriptSceneNode,
    'GLTFLight':py_generated.GLTFLight,
    'Performance':py_generated.Performance,
    '_File':py_generated._File,
    'TCP_Server':py_generated.TCP_Server,
    'TouchScreenButton':py_generated.TouchScreenButton,
    'AudioStreamPlayer':py_generated.AudioStreamPlayer,
    'VisualShaderNodeTransformConstant':py_generated.VisualShaderNodeTransformConstant,
    'GridContainer':py_generated.GridContainer,
    'Room':py_generated.Room,
    'Input':py_generated.Input,
    'ShaderMaterial':py_generated.ShaderMaterial,
    'PluginScript':py_generated.PluginScript,
    'CenterContainer':py_generated.CenterContainer,
    'Node':py_generated.Node,
    'EditorSpatialGizmo':py_generated.EditorSpatialGizmo,
    'Joint2D':py_generated.Joint2D,
    'CameraServer':py_generated.CameraServer,
    'VisualShaderNodeTexture':py_generated.VisualShaderNodeTexture,
    'Physics2DTestMotionResult':py_generated.Physics2DTestMotionResult,
    'VisualShaderNodeTransformFunc':py_generated.VisualShaderNodeTransformFunc,
    'EncodedObjectAsID':py_generated.EncodedObjectAsID,
    'AudioEffectFilter':py_generated.AudioEffectFilter,
    'VisualShaderNodeTransformUniform':py_generated.VisualShaderNodeTransformUniform,
    'ConvexPolygonShape':py_generated.ConvexPolygonShape,
    'GrooveJoint2D':py_generated.GrooveJoint2D,
    'PackedDataContainerRef':py_generated.PackedDataContainerRef,
    'InputEventScreenTouch':py_generated.InputEventScreenTouch,
    'CSGPrimitive':py_generated.CSGPrimitive,
    'VisualScriptCustomNode':py_generated.VisualScriptCustomNode,
    'AudioEffect':py_generated.AudioEffect,
    'CheckBox':py_generated.CheckBox,
    'LineShape2D':py_generated.LineShape2D,
    'RayShape':py_generated.RayShape,
    'Bone2D':py_generated.Bone2D,
    'VisualScriptIndexGet':py_generated.VisualScriptIndexGet,
    'EditorProperty':py_generated.EditorProperty,
    'VisualShaderNodeColorOp':py_generated.VisualShaderNodeColorOp,
    'Font':py_generated.Font,
    'OpenSimplexNoise':py_generated.OpenSimplexNoise,
    'AnimatedSprite':py_generated.AnimatedSprite,
    'PackedScene':py_generated.PackedScene,
    'AudioStreamGeneratorPlayback':py_generated.AudioStreamGeneratorPlayback,
    'PhysicsShapeQueryParameters':py_generated.PhysicsShapeQueryParameters,
    'LinkButton':py_generated.LinkButton,
    '_Marshalls':py_generated._Marshalls,
    'AudioEffectInstance':py_generated.AudioEffectInstance,
    'BackBufferCopy':py_generated.BackBufferCopy,
    'VisualShaderNodeVectorRefract':py_generated.VisualShaderNodeVectorRefract,
    'WebRTCPeerConnection':py_generated.WebRTCPeerConnection,
    'CapsuleShape':py_generated.CapsuleShape,
    'CSGTorus':py_generated.CSGTorus,
    'VisualScriptSelect':py_generated.VisualScriptSelect,
    'ScriptEditor':py_generated.ScriptEditor,
    'CanvasItemMaterial':py_generated.CanvasItemMaterial,
    'VisualScriptSubCall':py_generated.VisualScriptSubCall,
    'VisualShaderNodeGlobalExpression':py_generated.VisualShaderNodeGlobalExpression,
    'AudioEffectReverb':py_generated.AudioEffectReverb,
    'Spatial':py_generated.Spatial,
    'StyleBox':py_generated.StyleBox,
    'AStar':py_generated.AStar,
    'Sky':py_generated.Sky,
    'RegExMatch':py_generated.RegExMatch,
    'VSlider':py_generated.VSlider,
    'BaseButton':py_generated.BaseButton,
    'SpatialMaterial':py_generated.SpatialMaterial,
    'ProjectSettings':py_generated.ProjectSettings,
    'AudioEffectCompressor':py_generated.AudioEffectCompressor,
    'InputEventWithModifiers':py_generated.InputEventWithModifiers,
    'VisualShaderNodeSwitch':py_generated.VisualShaderNodeSwitch,
    'CameraTexture':py_generated.CameraTexture,
    'StreamPeerSSL':py_generated.StreamPeerSSL,
    'HBoxContainer':py_generated.HBoxContainer,
    'VisualShaderNodeScalarSwitch':py_generated.VisualShaderNodeScalarSwitch,
    'VisualShaderNodeIs':py_generated.VisualShaderNodeIs,
    'SpringArm':py_generated.SpringArm,
    'AnimationNodeAdd2':py_generated.AnimationNodeAdd2,
    'AStar2D':py_generated.AStar2D,
    'EditorNavigationMeshGenerator':py_generated.EditorNavigationMeshGenerator,
    'PanelContainer':py_generated.PanelContainer,
    'VisualScriptSceneTree':py_generated.VisualScriptSceneTree,
    'ResourceFormatSaver':py_generated.ResourceFormatSaver,
    'VisualScriptVariableGet':py_generated.VisualScriptVariableGet,
    'AudioEffectEQ10':py_generated.AudioEffectEQ10,
    'HTTPRequest':py_generated.HTTPRequest,
    'VisibilityEnabler':py_generated.VisibilityEnabler,
    'AtlasTexture':py_generated.AtlasTexture,
    'SpatialVelocityTracker':py_generated.SpatialVelocityTracker,
    'Curve':py_generated.Curve,
    'ARVRAnchor':py_generated.ARVRAnchor,
    'DynamicFontData':py_generated.DynamicFontData,
    'PlaneShape':py_generated.PlaneShape,
    'SurfaceTool':py_generated.SurfaceTool,
    'UndoRedo':py_generated.UndoRedo,
    'VisualShaderNodeTextureUniformTriplanar':py_generated.VisualShaderNodeTextureUniformTriplanar,
    'AnimationPlayer':py_generated.AnimationPlayer,
    'AudioEffectLimiter':py_generated.AudioEffectLimiter,
    'RandomNumberGenerator':py_generated.RandomNumberGenerator,
    'ReferenceRect':py_generated.ReferenceRect,
    'World2D':py_generated.World2D,
    '_JSON':py_generated._JSON,
    'InputEventMouseMotion':py_generated.InputEventMouseMotion,
    'X509Certificate':py_generated.X509Certificate,
    'UPNPDevice':py_generated.UPNPDevice,
    'CSGPolygon':py_generated.CSGPolygon,
    'VisualShader':py_generated.VisualShader,
    'VisibilityNotifier':py_generated.VisibilityNotifier,
    'Texture3D':py_generated.Texture3D,
    'WebXRInterface':py_generated.WebXRInterface,
    'AudioEffectLowPassFilter':py_generated.AudioEffectLowPassFilter,
    'VisualScriptPropertyGet':py_generated.VisualScriptPropertyGet,
    'GLTFMesh':py_generated.GLTFMesh,
    '_ClassDB':py_generated._ClassDB,
    'VisualScript':py_generated.VisualScript,
    'AnimationNodeBlendSpace2D':py_generated.AnimationNodeBlendSpace2D,
    'BoxContainer':py_generated.BoxContainer,
    'VisualShaderNodeVectorScalarStep':py_generated.VisualShaderNodeVectorScalarStep,
    'AnimationNodeAnimation':py_generated.AnimationNodeAnimation,
    'VisualScriptIterator':py_generated.VisualScriptIterator,
    'EditorImportPlugin':py_generated.EditorImportPlugin,
    'AudioStreamPlaybackResampled':py_generated.AudioStreamPlaybackResampled,
    'NativeScript':py_generated.NativeScript,
    'World':py_generated.World,
    'GraphEdit':py_generated.GraphEdit,
    'Physics2DDirectBodyStateSW':py_generated.Physics2DDirectBodyStateSW,
    'Curve2D':py_generated.Curve2D,
    'VisualShaderNodeVectorScalarMix':py_generated.VisualShaderNodeVectorScalarMix,
    'PhysicalBone':py_generated.PhysicalBone,
    'VisualShaderNodeTextureUniform':py_generated.VisualShaderNodeTextureUniform,
    'PHashTranslation':py_generated.PHashTranslation,
    'CollisionObject':py_generated.CollisionObject,
    'DampedSpringJoint2D':py_generated.DampedSpringJoint2D,
    'AudioEffectPhaser':py_generated.AudioEffectPhaser,
    'WindowDialog':py_generated.WindowDialog,
    'EditorSpatialGizmoPlugin':py_generated.EditorSpatialGizmoPlugin,
    'VehicleBody':py_generated.VehicleBody,
    'StreamPeerBuffer':py_generated.StreamPeerBuffer,
    'DynamicFont':py_generated.DynamicFont,
    'AudioEffectDistortion':py_generated.AudioEffectDistortion,
    'MeshInstance2D':py_generated.MeshInstance2D,
    'Navigation2D':py_generated.Navigation2D,
    'MainLoop':py_generated.MainLoop,
    'VSeparator':py_generated.VSeparator,
    'PathFollow':py_generated.PathFollow,
    'VisualShaderNode':py_generated.VisualShaderNode,
    'Listener2D':py_generated.Listener2D,
    'Sprite3D':py_generated.Sprite3D,
    'CSGShape':py_generated.CSGShape,
    'VisualScriptLocalVarSet':py_generated.VisualScriptLocalVarSet,
    'VisualShaderNodeOuterProduct':py_generated.VisualShaderNodeOuterProduct,
    'ArrayMesh':py_generated.ArrayMesh,
    'Expression':py_generated.Expression,
    'MeshLibrary':py_generated.MeshLibrary,
    'HScrollBar':py_generated.HScrollBar,
    'SceneState':py_generated.SceneState,
    'Material':py_generated.Material,
    'XMLParser':py_generated.XMLParser,
    'FileSystemDock':py_generated.FileSystemDock,
    'WebSocketClient':py_generated.WebSocketClient,
    'Crypto':py_generated.Crypto,
    'EditorSceneImporterGLTF':py_generated.EditorSceneImporterGLTF,
    'StyleBoxEmpty':py_generated.StyleBoxEmpty,
    'StreamTexture':py_generated.StreamTexture,
    'GDScriptFunctionState':py_generated.GDScriptFunctionState,
    'VisualScriptConstant':py_generated.VisualScriptConstant,
    'CollisionShape':py_generated.CollisionShape,
    'Environment':py_generated.Environment,
    'MultiMesh':py_generated.MultiMesh,
    'UDPServer':py_generated.UDPServer,
    'VisualShaderNodeScalarInterp':py_generated.VisualShaderNodeScalarInterp,
    'VisualShaderNodeVectorSmoothStep':py_generated.VisualShaderNodeVectorSmoothStep,
    'AESContext':py_generated.AESContext,
    'WebRTCMultiplayer':py_generated.WebRTCMultiplayer,
    'StyleBoxTexture':py_generated.StyleBoxTexture,
    'ClippedCamera':py_generated.ClippedCamera,
    'WebSocketPeer':py_generated.WebSocketPeer,
    'EditorPlugin':py_generated.EditorPlugin,
    'GLTFAnimation':py_generated.GLTFAnimation,
    'TabContainer':py_generated.TabContainer,
    'ConvexPolygonShape2D':py_generated.ConvexPolygonShape2D,
    'GDNative':py_generated.GDNative,
    'VisualScriptMathConstant':py_generated.VisualScriptMathConstant,
    'Physics2DServerSW':py_generated.Physics2DServerSW,
    'VisualShaderNodeFaceForward':py_generated.VisualShaderNodeFaceForward,
    'AudioStreamPlayback':py_generated.AudioStreamPlayback,
    'PhysicsMaterial':py_generated.PhysicsMaterial,
    'CircleShape2D':py_generated.CircleShape2D,
    'VisualShaderNodeBooleanUniform':py_generated.VisualShaderNodeBooleanUniform,
    'VisualScriptSequence':py_generated.VisualScriptSequence,
    'WebSocketMultiplayerPeer':py_generated.WebSocketMultiplayerPeer,
    '_VisualScriptEditor':py_generated._VisualScriptEditor,
    'SphereMesh':py_generated.SphereMesh,
    'RemoteTransform2D':py_generated.RemoteTransform2D,
    'Tween':py_generated.Tween,
    'EditorFileDialog':py_generated.EditorFileDialog,
    'Range':py_generated.Range,
    'AudioEffectHighPassFilter':py_generated.AudioEffectHighPassFilter,
    'ConcavePolygonShape':py_generated.ConcavePolygonShape,
    'TreeItem':py_generated.TreeItem,
    'LightOccluder2D':py_generated.LightOccluder2D,
    'TriangleMesh':py_generated.TriangleMesh,
    'Path':py_generated.Path,
    'UPNP':py_generated.UPNP,
    'SpriteBase3D':py_generated.SpriteBase3D,
    'OccluderPolygon2D':py_generated.OccluderPolygon2D,
    'GraphNode':py_generated.GraphNode,
    'AnimationNode':py_generated.AnimationNode,
    'VisualShaderNodeGroupBase':py_generated.VisualShaderNodeGroupBase,
    'Physics2DDirectSpaceState':py_generated.Physics2DDirectSpaceState,
    'VisibilityEnabler2D':py_generated.VisibilityEnabler2D,
    'Container':py_generated.Container,
    'PCKPacker':py_generated.PCKPacker,
    'AudioEffectEQ21':py_generated.AudioEffectEQ21,
    'VisualShaderNodeCubeMap':py_generated.VisualShaderNodeCubeMap,
    'VisualInstance':py_generated.VisualInstance,
    'GlobalConstants':py_generated.GlobalConstants,
    'ViewportTexture':py_generated.ViewportTexture,
    'Area':py_generated.Area,
    'VisualShaderNodeTransformVecMult':py_generated.VisualShaderNodeTransformVecMult,
    'AnimationTree':py_generated.AnimationTree,
    'ARVRInterfaceGDNative':py_generated.ARVRInterfaceGDNative,
    'InterpolatedCamera':py_generated.InterpolatedCamera,
    'VisualShaderNodeUniform':py_generated.VisualShaderNodeUniform,
    'Occluder':py_generated.Occluder,
    'Tree':py_generated.Tree,
    '_Engine':py_generated._Engine,
    'PacketPeerUDP':py_generated.PacketPeerUDP,
    'Label':py_generated.Label,
    'ScrollContainer':py_generated.ScrollContainer,
    'AnimationNodeBlend2':py_generated.AnimationNodeBlend2,
    'SpatialGizmo':py_generated.SpatialGizmo,
    'HingeJoint':py_generated.HingeJoint,
    'EditorScriptPicker':py_generated.EditorScriptPicker,
    'AudioStreamGenerator':py_generated.AudioStreamGenerator,
    'AnimationNodeBlendTree':py_generated.AnimationNodeBlendTree,
    'VisualScriptYieldSignal':py_generated.VisualScriptYieldSignal,
    'CylinderShape':py_generated.CylinderShape,
    'JavaClass':py_generated.JavaClass,
    'ProxyTexture':py_generated.ProxyTexture,
    'KinematicBody':py_generated.KinematicBody,
    'AudioStreamRandomPitch':py_generated.AudioStreamRandomPitch,
    'AudioStreamMicrophone':py_generated.AudioStreamMicrophone,
    'NetworkedMultiplayerENet':py_generated.NetworkedMultiplayerENet,
    'ReflectionProbe':py_generated.ReflectionProbe,
    'AudioBusLayout':py_generated.AudioBusLayout,
    'BakedLightmapData':py_generated.BakedLightmapData,
    'CSGMesh':py_generated.CSGMesh,
    'NinePatchRect':py_generated.NinePatchRect,
    'PacketPeerStream':py_generated.PacketPeerStream,
    'CollisionObject2D':py_generated.CollisionObject2D,
    'VisualShaderNodeExpression':py_generated.VisualShaderNodeExpression,
    'WebRTCPeerConnectionGDNative':py_generated.WebRTCPeerConnectionGDNative,
    'MultiplayerPeerGDNative':py_generated.MultiplayerPeerGDNative,
    'ParticlesMaterial':py_generated.ParticlesMaterial,
    'ParallaxBackground':py_generated.ParallaxBackground,
    'PopupDialog':py_generated.PopupDialog,
    'ScriptCreateDialog':py_generated.ScriptCreateDialog,
    'EditorFileSystemDirectory':py_generated.EditorFileSystemDirectory,
    'VisualScriptSwitch':py_generated.VisualScriptSwitch,
    'EditorSettings':py_generated.EditorSettings,
    'EditorInspector':py_generated.EditorInspector,
    'GridMap':py_generated.GridMap,
    'ScrollBar':py_generated.ScrollBar,
    'VisualScriptOperator':py_generated.VisualScriptOperator,
    'GeometryInstance':py_generated.GeometryInstance,
    'JavaScriptObject':py_generated.JavaScriptObject,
    'Portal':py_generated.Portal,
    'SphereShape':py_generated.SphereShape,
    'VisualShaderNodeVec3Uniform':py_generated.VisualShaderNodeVec3Uniform,
    'AnimationNodeStateMachinePlayback':py_generated.AnimationNodeStateMachinePlayback,
    'Physics2DServer':py_generated.Physics2DServer,
    'EditorScript':py_generated.EditorScript,
    'VideoStreamTheora':py_generated.VideoStreamTheora,
    'NavigationPolygon':py_generated.NavigationPolygon,
    'RoomManager':py_generated.RoomManager,
    'InputMap':py_generated.InputMap,
    '_OS':py_generated._OS,
    'AudioEffectCapture':py_generated.AudioEffectCapture,
    'SpotLight':py_generated.SpotLight,
    'GLTFBufferView':py_generated.GLTFBufferView,
    'HSplitContainer':py_generated.HSplitContainer,
    'SliderJoint':py_generated.SliderJoint,
    'AudioEffectBandPassFilter':py_generated.AudioEffectBandPassFilter,
    'Image':py_generated.Image,
    'AudioStreamOGGVorbis':py_generated.AudioStreamOGGVorbis,
    'VisualShaderNodeColorFunc':py_generated.VisualShaderNodeColorFunc,
    'NetworkedMultiplayerPeer':py_generated.NetworkedMultiplayerPeer,
    'PrismMesh':py_generated.PrismMesh,
    'VehicleWheel':py_generated.VehicleWheel,
    'InputEventKey':py_generated.InputEventKey,
    'InputEventScreenDrag':py_generated.InputEventScreenDrag,
    'Camera2D':py_generated.Camera2D,
    'CryptoKey':py_generated.CryptoKey,
    'TextureButton':py_generated.TextureButton,
    'VisualShaderNodeCustom':py_generated.VisualShaderNodeCustom,
    'SceneTree':py_generated.SceneTree,
    'VisualScriptInputAction':py_generated.VisualScriptInputAction,
    'ARVRServer':py_generated.ARVRServer,
    'SceneTreeTimer':py_generated.SceneTreeTimer,
    'AnimatedTexture':py_generated.AnimatedTexture,
    'RegEx':py_generated.RegEx,
    'MeshDataTool':py_generated.MeshDataTool,
    'AnimationNodeBlend3':py_generated.AnimationNodeBlend3,
    'Theme':py_generated.Theme,
    'SoftBody':py_generated.SoftBody,
    'PhysicsServer':py_generated.PhysicsServer,
    'InputEventMagnifyGesture':py_generated.InputEventMagnifyGesture,
    'OmniLight':py_generated.OmniLight,
    'Sprite':py_generated.Sprite,
    'AnimationNodeTimeSeek':py_generated.AnimationNodeTimeSeek,
    'PinJoint2D':py_generated.PinJoint2D,
    'RigidBody2D':py_generated.RigidBody2D,
    'VideoStreamGDNative':py_generated.VideoStreamGDNative,
    '_Thread':py_generated._Thread,
    'CurveTexture':py_generated.CurveTexture,
    'VisualScriptTypeCast':py_generated.VisualScriptTypeCast,
    'CSGCylinder':py_generated.CSGCylinder,
    'JavaScript':py_generated.JavaScript,
    'AudioEffectLowShelfFilter':py_generated.AudioEffectLowShelfFilter,
    'ARVRCamera':py_generated.ARVRCamera,
    'AspectRatioContainer':py_generated.AspectRatioContainer,
    'InputEventAction':py_generated.InputEventAction,
    'StaticBody':py_generated.StaticBody,
    'TextureProgress':py_generated.TextureProgress,
    'AudioStreamSample':py_generated.AudioStreamSample,
    'VisualShaderNodeTransformCompose':py_generated.VisualShaderNodeTransformCompose,
    'MenuButton':py_generated.MenuButton,
    'Particles2D':py_generated.Particles2D,
    'NavigationMeshInstance':py_generated.NavigationMeshInstance,
    'VisualShaderNodeCubeMapUniform':py_generated.VisualShaderNodeCubeMapUniform,
    'CollisionPolygon':py_generated.CollisionPolygon,
    'VisualShaderNodeVectorLen':py_generated.VisualShaderNodeVectorLen,
    'AnimationTrackEditPlugin':py_generated.AnimationTrackEditPlugin,
    'AcceptDialog':py_generated.AcceptDialog,
    'EditorResourceConversionPlugin':py_generated.EditorResourceConversionPlugin,
    'SkinReference':py_generated.SkinReference,
    'VisualShaderNodeVectorScalarSmoothStep':py_generated.VisualShaderNodeVectorScalarSmoothStep,
    'AudioEffectChorus':py_generated.AudioEffectChorus,
    'AnimationNodeTimeScale':py_generated.AnimationNodeTimeScale,
    'AudioEffectHighShelfFilter':py_generated.AudioEffectHighShelfFilter,
    'VisualScriptGlobalConstant':py_generated.VisualScriptGlobalConstant,
    'TranslationServer':py_generated.TranslationServer,
    'HMACContext':py_generated.HMACContext,
    'AudioEffectSpectrumAnalyzerInstance':py_generated.AudioEffectSpectrumAnalyzerInstance,
    'VisualScriptVariableSet':py_generated.VisualScriptVariableSet,
    'AudioEffectDelay':py_generated.AudioEffectDelay,
    'VisualScriptPreload':py_generated.VisualScriptPreload,
    'PolygonPathFinder':py_generated.PolygonPathFinder,
    'Tabs':py_generated.Tabs,
    'VisualScriptSelf':py_generated.VisualScriptSelf,
    'VideoStreamWebm':py_generated.VideoStreamWebm,
    'VisualScriptReturn':py_generated.VisualScriptReturn,
    'VisualShaderNodeBooleanConstant':py_generated.VisualShaderNodeBooleanConstant,
    'AnimationNodeStateMachineTransition':py_generated.AnimationNodeStateMachineTransition,
    'AudioStream':py_generated.AudioStream,
    'TileSet':py_generated.TileSet,
    'RayShape2D':py_generated.RayShape2D,
    'RigidBody':py_generated.RigidBody,
    'FileDialog':py_generated.FileDialog,
    'Camera':py_generated.Camera,
    'AudioStreamPlayer3D':py_generated.AudioStreamPlayer3D,
    'MultiMeshInstance':py_generated.MultiMeshInstance,
    'Polygon2D':py_generated.Polygon2D,
    'ResourceInteractiveLoader':py_generated.ResourceInteractiveLoader,
    'VisualScriptEmitSignal':py_generated.VisualScriptEmitSignal,
    'Skeleton2D':py_generated.Skeleton2D,
    'BulletPhysicsDirectBodyState':py_generated.BulletPhysicsDirectBodyState,
    '_ResourceLoader':py_generated._ResourceLoader,
    'Timer':py_generated.Timer,
    'AnimationTreePlayer':py_generated.AnimationTreePlayer,
    'InputDefault':py_generated.InputDefault,
    'AnimationNodeAdd3':py_generated.AnimationNodeAdd3,
    'SplitContainer':py_generated.SplitContainer,
    'ConfirmationDialog':py_generated.ConfirmationDialog,
    'TextEdit':py_generated.TextEdit,
    'Script':py_generated.Script,
    'KinematicCollision':py_generated.KinematicCollision,
    'CullInstance':py_generated.CullInstance,
    'VisualShaderNodeDeterminant':py_generated.VisualShaderNodeDeterminant,
    'BoxShape':py_generated.BoxShape,
    'VSplitContainer':py_generated.VSplitContainer,
    'Path2D':py_generated.Path2D,
    'AnimationNodeTransition':py_generated.AnimationNodeTransition,
    'ParallaxLayer':py_generated.ParallaxLayer,
    'VisualScriptCondition':py_generated.VisualScriptCondition,
    'VisualServer':py_generated.VisualServer,
    'AnimationRootNode':py_generated.AnimationRootNode,
    'GLTFNode':py_generated.GLTFNode,
    'VisualScriptWhile':py_generated.VisualScriptWhile,
    'ShortCut':py_generated.ShortCut,
    'EditorInterface':py_generated.EditorInterface,
    'Light2D':py_generated.Light2D,
    'VisualShaderNodeScalarConstant':py_generated.VisualShaderNodeScalarConstant,
    'CanvasLayer':py_generated.CanvasLayer,
    'HSlider':py_generated.HSlider,
    'VisualShaderNodeVectorClamp':py_generated.VisualShaderNodeVectorClamp,
    'ColorRect':py_generated.ColorRect,
    'Navigation':py_generated.Navigation,
    'JavaClassWrapper':py_generated.JavaClassWrapper,
    'MultiplayerAPI':py_generated.MultiplayerAPI,
    'HSeparator':py_generated.HSeparator,
    'AudioEffectPitchShift':py_generated.AudioEffectPitchShift,
    'IP_Unix':py_generated.IP_Unix,
    'VisualScriptLocalVar':py_generated.VisualScriptLocalVar,
    'AudioServer':py_generated.AudioServer,
    'VisualScriptFunction':py_generated.VisualScriptFunction,
    'MeshTexture':py_generated.MeshTexture,
    'Joint':py_generated.Joint,
    'VisualScriptResourcePath':py_generated.VisualScriptResourcePath,
    'ButtonGroup':py_generated.ButtonGroup,
    'AudioEffectAmplify':py_generated.AudioEffectAmplify,
    'ColorPicker':py_generated.ColorPicker,
    'VisualScriptBasicTypeConstant':py_generated.VisualScriptBasicTypeConstant,
    'VisualScriptDeconstruct':py_generated.VisualScriptDeconstruct,
    'OccluderShape':py_generated.OccluderShape,
    'HeightMapShape':py_generated.HeightMapShape,
    'InputEventMouseButton':py_generated.InputEventMouseButton,
    'DTLSServer':py_generated.DTLSServer,
    'GLTFTexture':py_generated.GLTFTexture,
    'VisualShaderNodeScalarOp':py_generated.VisualShaderNodeScalarOp,
    'WebRTCDataChannelGDNative':py_generated.WebRTCDataChannelGDNative,
    'EditorResourcePicker':py_generated.EditorResourcePicker,
    'VideoStream':py_generated.VideoStream,
    'VisualScriptEngineSingleton':py_generated.VisualScriptEngineSingleton,
    'JSONParseResult':py_generated.JSONParseResult,
    'YSort':py_generated.YSort,
    'AudioEffectBandLimitFilter':py_generated.AudioEffectBandLimitFilter,
    'PhysicsBody':py_generated.PhysicsBody,
    'VisualShaderNodeVectorFunc':py_generated.VisualShaderNodeVectorFunc,
    '_Semaphore':py_generated._Semaphore,
    'Panel':py_generated.Panel,
    'SpriteFrames':py_generated.SpriteFrames,
    'RayCast':py_generated.RayCast,
    'BoneAttachment':py_generated.BoneAttachment,
    'Position2D':py_generated.Position2D,
    }
    convert.init_convert(dict_convert, get_class)

def get_class(Wrapper wrapper):
    return py_generated.Object.cast(wrapper).get_class()
