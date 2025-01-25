extends Area2D

var inmunidad = 0
const danio = -20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("movimiento")
	add_to_group("peces")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	inmunidad -= delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador") && inmunidad < 0:
		Controlador.actualizar_medidor_oxigeno(danio)
		inmunidad = 1
