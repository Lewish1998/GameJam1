extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#@export var char_scale = Vector2(10, 10)
#var scale_factor = 0.01

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# twine

func _physics_process(_delta):
	
	# PLAYER SCALE 
	#var scale_increase = (position.y) * scale_factor
	#scale = char_scale + Vector2(scale_increase, scale_increase)
	

	#1400
	#800
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var last_direction = velocity
	# Walking animations
	if direction:	
		if direction == Vector2(-1, 0):
			$AnimatedSprite2D.play("walk left")
		if direction == Vector2(1, 0):
			$AnimatedSprite2D.play("walk right")
		if direction == Vector2(0, -1):
			$AnimatedSprite2D.play("walk back")
		if direction == Vector2(0, 1):
			$AnimatedSprite2D.play("walk front")
		
		velocity = direction * SPEED
		
			
		
	#if direction:
		# movement
		#velocity = direction * SPEED


	else:
		if last_direction == Vector2(-300, 0):
			$AnimatedSprite2D.play("idle left")
		if last_direction == Vector2(300, 0):
			$AnimatedSprite2D.play("idle right")
		if last_direction == Vector2(0, -300):
			$AnimatedSprite2D.play("idle back")
		if last_direction == Vector2(0, 300):
			$AnimatedSprite2D.play("idle front")
			
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

		# TODO play idle movement on stop facing direction

	move_and_slide()
