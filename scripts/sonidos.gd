extends Node
@onready var audio_player_1 = $AudioStreamPlayer
@onready var audio_player_2 = $AudioStreamPlayer2
var buffer_time = 0.1 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player_1.connect("finished", Callable(self, "_on_audio_player_1_finished"))
	audio_player_2.connect("finished", Callable(self, "_on_audio_player_2_finished"))
	audio_player_1.play()
	pass # Replace with function body.

func _process(_delta):
	if audio_player_1.is_playing() and audio_player_1.get_playback_position() >= audio_player_1.stream.get_length() - buffer_time:
		if not audio_player_2.is_playing():
			audio_player_2.play()
	if audio_player_2.is_playing() and audio_player_2.get_playback_position() >= audio_player_2.stream.get_length() - buffer_time:
		if not audio_player_1.is_playing():
			audio_player_1.play()

func _on_audio_player_1_finished():
	audio_player_2.play()

func _on_audio_player_2_finished():
	audio_player_1.play()
