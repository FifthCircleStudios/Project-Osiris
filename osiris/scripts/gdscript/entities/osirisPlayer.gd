class_name osirisPlayer
extends CharacterBody3D
#Mechanisms for Player
@export_category("Mechanic Settings/Toggle")
#@export var charAnimations :
@export var compLocomotion : locomotionComp
@export var compJump
@export var compDodge
@export var compKickback
@export var compHitbox
@export var compHealth
@export var compPlayerRotation
#@export var compHeadRotation
#Audio Settings on Player
@export_category("Audio")
@export var playerFootsteps : audioFootsteps

#
var inputDirection: Vector3 = Vector3.ZERO
var lastInputOnGround: Vector3 = Vector3.ZERO


func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
# Player Movement Inputs
	inputDirection.x = Input.get_action_strength("right") - \
		Input.get_action_strength("left")
	inputDirection.z = Input.get_action_strength("backward") - \
		Input.get_action_strength("forward")
	lastInputOnGround = inputDirection if is_on_floor() else \
		lastInputOnGround
	pass
