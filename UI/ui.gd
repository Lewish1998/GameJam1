extends CanvasLayer

@onready var label = $Panel/Label


func _process(_delta):
	label.text = str(GameObjects.num_objects) + "/3"
