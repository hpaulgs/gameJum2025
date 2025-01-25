extends CharacterBody2D


var SPEED = 0

func _ready() -> void:
	add_to_group("peces")
	

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()
