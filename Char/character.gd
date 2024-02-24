extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var character_movement = true
var walking = false
var playing = false
#@export var char_scale = Vector2(10, 10)
#var scale_factor = 0.01


#func walk():
	#if walking == true:
		#playing = true
		#if playing:
			##$FootstepPlayer.play()
			#print("Playing")
	#else:
		#playing = false
		##$FootstepPlayer.stop()
		
func walk():
	if walking == true and playing == true:
		print("Walking")


func _physics_process(_delta):

	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var last_direction = velocity
	if character_movement == true:

		
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
			
			if velocity:
				walking = true
				playing = true

		else:
			walking = false
			playing = false
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

		move_and_slide()

		walk()
