extends Node2D

var rng = RandomNumberGenerator.new()
var flicker = 3

var sound_player := AudioStreamPlayer.new()

func _ready():
	# Add the AudioStreamPlayer as a child to the player node
	add_child(sound_player)
	var sound_effect = load("res://SoundEffects/Ominous Drone Grey Room.mp3")
	sound_player.stream = sound_effect
	sound_player.play()

func _process(delta):
	var my_random_number = rng.randf_range(0.0, 1.7)
	$PointLight2D.energy = lerp($PointLight2D.energy, my_random_number, flicker*delta)
	
	if GameObjects.num_objects >= 3:
		print("Next room")
		GameObjects.num_objects = 0
		GameObjects.current_room = "Pond"
		get_tree().change_scene_to_file("res://room2/room_2.tscn")
		
		# show text box 
		# show the duck ?
		# wait for plater input
		# transition to next scene

