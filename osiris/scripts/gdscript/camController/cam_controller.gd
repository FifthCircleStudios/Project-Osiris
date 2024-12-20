class_name camController
extends SpringArm3D

#Exports
@export var enabled: bool = true
#Cam Settings
@export_category("Camera Settings")
@export var cam_distance: float = 2.0
@export var vert_offset: float = 1.5
@export var cam_angle: float = 0.0
@export var cam_fov: float = 90.0
@export var tilt_upper_limit := PI / 3.0
@export var tilt_lower_limit := -PI / 6.0
#Mouse Settings
@export_category("Mouse Settings")
@export var mouseSensitivity: float = 5.0

var lookingAround: bool
var _cam_input_direction := Vector2.ZERO
@onready var player = osirisPlayer
@onready var _cam_pivot: Node3D = %camPivot

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event.is_action_pressed("left_click"):
		Input.MOUSE_MODE_CAPTURED
		
func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion := (
		event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)
	if is_camera_motion:
		_cam_input_direction = event.screen_relative * mouseSensitivity
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	
	global_position = player.global_position + Vector3(
		0, 
		vertical_offset, 
		0
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_cam_pivot.rotation.x += _cam_input_direction.y * delta
	_cam_pivot.rotation.x = clamp(_cam_pivot.rotation.x, tilt_lower_limit, tilt_upper_limit)
	_cam_pivot.rotation.y -= _cam_input_direction.x * delta
	_cam_input_direction - Vector2.ZERO
	
	pass
