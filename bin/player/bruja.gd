extends CharacterBody2D

@export var speed = 250.0
var eje = "x"

var mensajesBruja = [
	"estoy cerca niña",
	"te estoy siguiendo",
	"seras mia"
]

func _ready() -> void:
	Gl.bruja = self
	
# Called when the node enters the scene tree for the first time.
func emit_song() -> void:
	$sonidp.play()

func desaparecer():
	self.show()
	$Contact/Col.disabled = false
	$Col.disabled = false
	await get_tree().create_timer(randi_range(10, 60)).timeout
	self.hide()
	$Contact/Col.disabled = true
	$Col.disabled = true
	await get_tree().create_timer(randi_range(10, 60)).timeout
	desaparecer()
	pass

func changeEje(ej):
	eje = ej
	pass

func _process(delta: float) -> void:
	if Gl.player != null:
		var direction = (Gl.player.global_position - global_position).normalized()
		velocity = direction * speed
		velocity.y = 0
		if velocity.x < 0:
			$bruja.flip_h = true
			$Label.position = Vector2(-300, -54)
		elif velocity.x > 0:
			$bruja.flip_h = false
			$Label.position = Vector2(200, -54)
		move_and_slide()
	pass

func _on_visible_screen_entered() -> void:
	$Label.text = mensajesBruja[randi_range(0, mensajesBruja.size() - 1) ]
	$Label.show()
	pass # Replace with function body.

func _on_visible_screen_exited() -> void:
	$Label.hide()
	pass # Replace with function body.

func _on_contact_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.dead()
	pass # Replace with function body.

func transporte(v):
	var value = randi_range(0, 1)
	if value == 1:
		v.x = (v.x - 1000)
	else:
		v.x = (v.x + 1000)	
	v.y = (v.y - 200)
	self.global_position = v
	self.show()
	$Contact/Col.disabled = false
	$Col.disabled = false
	pass
