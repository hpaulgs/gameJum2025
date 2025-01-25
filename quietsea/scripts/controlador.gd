extends Node

var oxigeno = 100
var bombona = null
var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
	
func actualizar_medidor_oxigeno(o2: float):
	oxigeno += o2
	if oxigeno > 100:
		oxigeno = 100
	elif oxigeno <= 0:
		oxigeno = 100
		Controlador.goto_scene("res://escenas/derrota.tscn")

	if oxigeno < 10:
		bombona.play("vacio")
	elif oxigeno < 30:
		bombona.play("1 barra")
	elif oxigeno < 50:
		bombona.play("2 barras")
	elif oxigeno < 70:
		bombona.play("3 barras")
	elif oxigeno < 90:
		bombona.play("4 barras")
	else:
		bombona.play("lleno")
