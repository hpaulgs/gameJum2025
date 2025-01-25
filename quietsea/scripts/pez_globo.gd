extends CharacterBody2D

const danio = -20
var submarino: CharacterBody2D
var SPEED = 0

func _ready() -> void:
	submarino = get_node("/root/escenarioPrincipal/Submarino")
	$Sprite2D/AnimationPlayer.play("movimiento")
	add_to_group("peces")
	

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		submarino.sonido("golpe")
		Controlador.actualizar_medidor_oxigeno(danio)
		queue_free() # elimino el pez globo
