extends Node2D

var velocidad_escenario = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Controlador.oxigeno = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position.y -= velocidad_escenario * delta
	$Muerte.position.y -= velocidad_escenario * delta
	$Tentaculo.position.y -= velocidad_escenario * delta
	$Tentaculo2.position.y -= velocidad_escenario * delta
	$Tentaculo3.position.y -= velocidad_escenario * delta
	$Tentaculo4.position.y -= velocidad_escenario * delta
	Controlador.actualizar_medidor_oxigeno(delta * -3)


func _on_victoria_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Controlador.goto_scene("res://escenas/victoria.tscn")


func _on_muerte_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Controlador.goto_scene("res://escenas/derrota.tscn")
