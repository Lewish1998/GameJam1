extends Node2D

var rng = RandomNumberGenerator.new()
var flicker = 3

var sound_player := AudioStreamPlayer.new()
var transition_scene = load("res://UI/Transition.tscn").instantiate()
func _ready():
	# Add the AudioStreamPlayer as a child to the player node
	add_child(sound_player)
	var sound_effect = load("res://SoundEffects/Yellow Room Music.mp3")
	sound_player.stream = sound_effect
	sound_player.play()

		
	
#
#func _process(delta):
	#var my_random_number = rng.randf_range(0.0, 1.7)
	#$PointLight2D.energy = lerp($PointLight2D.energy, my_random_number, flicker*delta)
	#
	#if GameObjects.num_objects >= 3:
		#print("Next room")
		#GameObjects.num_objects = 0
		#GameObjects.current_room = "Pond"
		#get_tree().change_scene_to_file("res://room2/room_2.tscn")
		#
		#
func _process(delta):
	# Existing process logic
	var my_random_number = rng.randf_range(0.0, 1.7)
	$PointLight2D.energy = lerp($PointLight2D.energy, my_random_number, flicker*delta)
	
	if GameObjects.num_objects >= 3:
		GameObjects.num_objects = 0
		GameObjects.current_room = "Pond"
		show_transition()

func show_transition():
	#var transition_scene = load("res://UI/Transition.tscn").instantiate()
	#add_child(transition_scene)
	#transition_scene.get_node("AnimationPlayer").connect("animation_finished", self, "_on_transition_finished")
	
	transition_scene.show()
	transition_scene.get_node("transition")

func _on_transition_finished():
	get_tree().change_scene("res://room2/room_2.tscn")

