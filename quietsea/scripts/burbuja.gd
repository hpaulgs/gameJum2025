extends Area2D

const recuperacion = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("movimiento")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		$AudioStreamPlayer2D.play()
		Controlador.actualizar_medidor_oxigeno(recuperacion)
		queue_free() # elimino la burbuja
