extends CharacterBody3D

@export_category("Ground Locomotion Settings")
@export var groundSpeed := 8.0
@export var acceleration := 20.0

@onready var camera: Camera3D = $camPivot/SpringArm3D/Camera3D

func _physics_process(delta: float) -> void:
	var rawInput := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var forward := camera.global_basis.z
	var right := camera.global_basis.x
	var moveDirection := forward * rawInput.y + right * rawInput.x
	if Input.is_action_pressed("move_forward"):
		$playerModel/AnimationPlayer.play("Walking")
	if Input.is_action_just_pressed("move_left"):
		$playerModel/AnimationPlayer.play("Leftturn90")
	if Input.is_action_just_pressed("move_right"):
		$playerModel/AnimationPlayer.play("Rightturn90")
	if Input.is_action_pressed("move_right"):
		$playerModel/AnimationPlayer.play("Rightstrafewalking")
	if Input.is_action_pressed("move_left"):
		$playerModel/AnimationPlayer.play("Leftstrafewalking")
	moveDirection.y = 0.0
	moveDirection = moveDirection.normalized()
	
	velocity = velocity.move_toward(moveDirection * groundSpeed, acceleration * delta)
	move_and_slide()
