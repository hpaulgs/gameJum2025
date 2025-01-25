extends CharacterBody2D

const SPEED = 300.0
var camera_limit_y = 0
var camera_escenario: Camera2D  # Variable para almacenar la referencia a la cámara del escenario principal

func _ready() -> void:
	add_to_group("jugador")
	# Obtener la referencia a la cámara del escenario principal
	camera_escenario = get_node("/root/escenarioPrincipal/Camera2D")

func _process(delta: float) -> void:
	# Obtener la posición Y de la cámara del escenario principal
	camera_limit_y = camera_escenario.position.y - 300

	# Verificar si la posición Y del submarino es menor que el límite de la cámara
	if position.y < camera_limit_y:
		position.y = camera_limit_y

	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -SPEED  # Cambiado a negativo para que el submarino suba

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
		if velocity.x < 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func sonido(nombre: String) -> void:
	if nombre == "golpe":
		$Golpe.play()
	elif nombre == "burbuja":
		$Burbuja.play()
