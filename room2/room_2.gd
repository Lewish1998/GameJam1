extends Node2D


var sound_player := AudioStreamPlayer.new()

func _ready():
	add_child(sound_player)
	var sound_effect = load("res://SoundEffects/Yellow Room Music.mp3")
	sound_player.stream = sound_effect
	sound_player.play()

	print("Testing")
