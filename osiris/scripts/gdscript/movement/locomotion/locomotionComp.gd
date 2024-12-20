class_name locomotionComp
extends Node

@export var enable: bool = true
@export var canChangeState: bool = true

@export var entity: CharacterBody3D

@export var defaultSpeed: float = 5
@export var speed: float
@export var gravity: float = 20.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
