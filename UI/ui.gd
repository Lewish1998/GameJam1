extends CanvasLayer

@onready var label = $Panel/Label
@onready var label2 = $Panel2/Label


func _process(_delta):
	label.text = str(GameObjects.num_objects) + "/3"
	label2.text = str(GameObjects.current_room)
	
