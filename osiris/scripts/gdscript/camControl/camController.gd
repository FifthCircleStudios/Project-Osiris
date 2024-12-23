extends Node3D

@export_category("Camera Settings")
@export var mouseSensitivity := 0.25
@export var clampMax = 45
@export var clampMin = -45

var camInputDirection := Vector2.ZERO

@onready var camPivot: Node3D = $PlayerCharacter/camPivot

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event: InputEvent) -> void:
	var isCamMotion := (
	event is InputEventMouseMotion and
	Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)
	if isCamMotion:
		camInputDirection = event.screen_relative * mouseSensitivity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	camPivot.rotation.x += camInputDirection.y * delta
	camPivot.rotation.x = clamp(camPivot.rotation.x,clampMin, clampMax)
	camPivot.rotation.y -= camInputDirection.x * delta
	
	camInputDirection = Vector2.ZERO
