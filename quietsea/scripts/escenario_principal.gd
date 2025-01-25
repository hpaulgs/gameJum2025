extends Node2D

var velocidad_escenario = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position.y -= velocidad_escenario * delta
	$Muerte.position.y -= velocidad_escenario * delta
	#$Camera2D.position.y = position.y
