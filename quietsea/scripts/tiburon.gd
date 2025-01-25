extends CharacterBody2D

const danio = -20

var SPEED = -100.0
var submarino: CharacterBody2D
var distancia_activacion = 700.0
var activado = false

func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("movimiento")
	submarino = get_node("/root/escenarioPrincipal/Submarino")
	add_to_group("peces")
	

func _physics_process(delta: float) -> void:
	var distancia = global_position.distance_to(submarino.global_position)
	if distancia <= distancia_activacion:
		activado = true
		
	if activado:
		velocity.x = SPEED
		move_and_slide()
	else:
		velocity.x = 0
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Controlador.actualizar_medidor_oxigeno(danio)
		queue_free() # elimino el tiburón
