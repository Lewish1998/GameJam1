extends StaticBody2D
var is_entered = false

var sound_player := AudioStreamPlayer.new()

var action_pressed = 0


func _on_area_2d_body_entered(body):
	if body.name == "Character":
		print("Char entered")
		$DialogBox.show_dialog("Press 'E' to interact")
		
		is_entered = true
		
func _on_area_2d_body_exited(body):
	if body.name == "Character":
		$DialogBox.hide()
		is_entered = false


func _process(_delta):
	if is_entered:
		if Input.is_action_just_pressed("Interact"):
			action_pressed += 1
			
			GameObjects.num_objects += 1
			$DialogBox.show_dialog("I could have used a lot more than just one band-aid then…")
			 
		if Input.is_action_just_pressed("Interact") and action_pressed == 1: # press button to progress not working
			action_pressed += 1
			var tween = get_tree().create_tween()
			var tween1 = get_tree().create_tween()
			tween.tween_property(self, "position", position - Vector2(0,30), 2)
			tween1.tween_property(self, "modulate:a", 0, 2)
		
			tween.tween_callback(queue_free)

			
			add_child(sound_player)
			var sound_effect = load("res://SoundEffects/Item Found!.mp3")
			sound_player.stream = sound_effect
			sound_player.play()



func _on_area_2d_area_entered(area):
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	pass # Replace with function body.

