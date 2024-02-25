extends CanvasLayer

func _ready():
	visible = true
	

func _process(delta):
	if GameObjects.current_room == "Pond":
		await get_tree().create_timer(10).timeout
		visible = false
		
