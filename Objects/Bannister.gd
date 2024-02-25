extends Node2D

var is_entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Character":
		$DialogBox.show_dialog("I can’t go. I was looking for something… I think")
		print("Entered")
		is_entered = true
		
func _on_area_2d_body_exited(body):
	if body.name == "Character":
		$DialogBox.hide()
		is_entered = false
