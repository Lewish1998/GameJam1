extends Node2D


var sound_player := AudioStreamPlayer.new()

func _ready():
	# Add the AudioStreamPlayer as a child to the player node
	add_child(sound_player)
	var sound_effect = load("res://SoundEffects/Ominous Drone Grey Room.mp3")
	sound_player.stream = sound_effect
	sound_player.play()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://room1/room_1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_howtoplay_pressed():
	get_tree().change_scene_to_file("res://howtoplay/how_to_play.tscn")
