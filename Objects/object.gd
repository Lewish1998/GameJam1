extends StaticBody2D
var is_entered = false


func _on_area_2d_body_entered(body):
	if body.name == "Character":
		$DialogBox.show_dialog("Testing text")
		
		is_entered = true


func _process(_delta):
	if is_entered:
		if Input.is_action_just_pressed("Interact"):
			print("interacted")
			
			GameObjects.num_objects += 1

			var tween = get_tree().create_tween()
			var tween1 = get_tree().create_tween()
			tween.tween_property(self, "position", position - Vector2(0,30), 0.5)
			tween1.tween_property(self, "modulate:a", 0, 0.3)
		
			tween.tween_callback(queue_free)

