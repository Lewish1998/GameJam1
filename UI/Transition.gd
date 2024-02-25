extends Node2D

func _ready():
	print($Sprite2D.modulate)
	$Sprite2D.modulate = Color(1.0, 1.0, 1.0, 0.0)
	



func _process(delta):
	if GameObjects.num_objects >= 3:
		$Sprite2D.modulate = Color(1.0, 1.0, 1.0, 1.0)
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0,30), 5)
		tween1.tween_property(self, "modulate:a", 0, 3)

		tween.tween_callback(queue_free)

		#await get_tree().create_timer(6).timeout
		#GameObjects.scene_change = 1
