extends Node2D

var bruja = "res://bin/player/bruja.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout
	createBoss()
	pass # Replace with function body.
	
func createBoss():
	var newBruja = load(bruja).instantiate()
	$Marker2D.add_child(newBruja)
	newBruja.emit_song()
	pass
