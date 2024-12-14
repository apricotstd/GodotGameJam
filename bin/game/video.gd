extends Node2D

@onready var Game = $".."
@onready var textBox = $Node/Control/RichTextLabel

var initDialog = false

var dialogInicial = [
		"[color=green]Niña[/color]: OH, Donde estoy?",
		"[color=red]Bruja[/color]: JAJAJAJAJAJA....",
		"[color=red]Bruja[/color]: ¡Ho! niña, has venido a mi mundo....",
		"[color=green]Niña[/color]: AAAAAAAAAAAAA...?",
		"[color=green]Niña[/color]: Quien eres tú?",
		"[color=red]Bruja[/color]: Tú peor pesadilla... este lugar es",
		"[color=red]Bruja[/color]: Un lugar donde no hay nada, solo pesadillas...",
		"[color=red]Bruja[/color]: JAJAJAJAJAJAJA"
]

var indexDialog = 0
var char_index = 0
var textSpeed = 0.04


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	$AnimationPlayer.play("init")
	textBox.text = ""
	pass # Replace with function body.

func finishEvent():
	indexDialog += 1

func iniciarDialog(): 
	if indexDialog < dialogInicial.size(): 
		textBox.text = dialogInicial[indexDialog] 
		textBox.visible_characters = 0 
		char_index = 0 
		await get_tree().create_timer(textSpeed).timeout
		mostrarLetraPorLetra() 
		indexDialog += 1 

func mostrarLetraPorLetra(): 
	if char_index < textBox.text.length(): 
		char_index += 1 
		textBox.visible_characters = char_index 
		await get_tree().create_timer(textSpeed).timeout
		mostrarLetraPorLetra()
	else:
		iniciarDialog()

func changePj():
	$personaje.hide()
	$Node2D.show()
	$Node2D/personaje2.play("default")
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Game.initGame()
	self.queue_free()
	pass # Replace with function body.
