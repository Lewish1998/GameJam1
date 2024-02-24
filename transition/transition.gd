extends ParallaxBackground

var scrolling_speed = 100

var sound_player := AudioStreamPlayer.new()

func _process(delta):
	scroll_offset.y -= scrolling_speed * delta

func _ready():
	add_child(sound_player)
	var sound_effect = load("res://SoundEffects/Ominous Drone Grey Room.mp3")
	sound_player.stream = sound_effect
	sound_player.play()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://room1/room_1.tscn")
