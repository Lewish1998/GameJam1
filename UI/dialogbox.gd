extends CanvasLayer

@onready var label = $Panel/Text1
var is_entered = false

func _ready():
	hide()
	
func show_dialog(text):
	label.text = text
	show()
	
func hide_dialog():
	hide()



