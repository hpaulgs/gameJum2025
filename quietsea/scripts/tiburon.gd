extends CharacterBody2D

const danio = -30

var SPEED = -100.0

func _ready() -> void:
	add_to_group("peces")
	

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Controlador.actualizar_medidor_oxigeno(danio)
		queue_free() # elimino el tiburón
