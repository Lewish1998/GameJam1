extends CanvasLayer

@onready var label = $Panel/Text1

func _ready():
	hide()
	
func show_dialog(text):
	label.text = text
	show()
	
func hide_dialog():
	hide()
