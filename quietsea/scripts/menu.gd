extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Atras.visible = false
	$TextoControles.visible = false
	$Sprite2D.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jugar_pressed() -> void:
	Controlador.goto_scene("res://escenas/escenarioPrincipal.tscn")


func _on_controles_pressed() -> void:
	$Atras.visible = true
	$TextoControles.visible = true
	$Sprite2D.visible = true
	$Jugar.visible = false
	$Controles.visible = false
	$Salir.visible = false


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_atras_pressed() -> void:
	$Atras.visible = false
	$TextoControles.visible = false
	$Sprite2D.visible = false
	$Jugar.visible = true
	$Controles.visible = true
	$Salir.visible = true
