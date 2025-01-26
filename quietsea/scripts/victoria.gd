extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D3/AnimationPlayer.play("movimiento")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_inicio_pressed() -> void:
	Controlador.goto_scene("res://escenas/menu.tscn")


func _on_reintentar_pressed() -> void:
	Controlador.goto_scene("res://escenas/escenarioPrincipal.tscn")
