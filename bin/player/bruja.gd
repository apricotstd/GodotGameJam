extends CharacterBody2D

@export var speed = 200.0
var eje = "x"

var mensajesBruja = [
	"estoy cerca niña",
	"te estoy siguiendo",
	"seras mia"
]

# Called when the node enters the scene tree for the first time.
func emit_song() -> void:
	$sonidp.play()

func changeEje(ej):
	eje = ej
	pass

func _process(delta: float) -> void:
	if Gl.player != null:
		var direction = (Gl.player.global_position - position).normalized()
		velocity = direction * speed
		move_and_slide()
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.dead()
	pass # Replace with function body.

func _on_visible_screen_entered() -> void:
	$Label.text = mensajesBruja[randi_range(0, mensajesBruja.size() - 1) ]
	$Label.show()
	pass # Replace with function body.

func _on_visible_screen_exited() -> void:
	$Label.hide()
	pass # Replace with function body.
