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

#@onready var Player = Globals.player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
