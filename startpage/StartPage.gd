extends Node2D



func _ready():
	pass
	

func _on_start_pressed():
	get_tree().change_scene_to_file("res://room1/room_1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_howtoplay_pressed():
	get_tree().change_scene_to_file("res://howtoplay/how_to_play.tscn")
