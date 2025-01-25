extends CharacterBody2D

const danio = -20
var SPEED = -250.0
var submarino: CharacterBody2D
var distancia_activacion = 600.0
var activado = false

func _ready() -> void:
	submarino = get_node("/root/escenarioPrincipal/Submarino")
	$Sprite2D/AnimationPlayer.play("movimiento")
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
		queue_free() # elimino el pez espada
