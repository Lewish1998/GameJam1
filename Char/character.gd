extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var character_movement = true
#@export var char_scale = Vector2(10, 10)
#var scale_factor = 0.01

var walking = false
var playing = false
var last_direction = Vector2.ZERO

func _ready():
	$FootstepPlayer.stop()

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	walking = direction.length() > 0

	# Update the character's velocity based on the input direction
	self.velocity = direction.normalized() * SPEED if walking else Vector2.ZERO
	
	# Decide whether to play walking animations or idle based on current movement
	if walking:
		handle_walking(direction)
	elif last_direction != Vector2.ZERO:  # Only update idle animation if the character was previously moving
		handle_idle()
	
	# Remember the last direction for the next frame
	last_direction = direction if walking else Vector2.ZERO

	# Synchronize walking state with footstep sounds
	walk()

	# Apply movement
	move_and_slide()
	

func handle_walking(direction: Vector2):
	var anim = get_animation_from_direction(direction)
	if anim != $AnimatedSprite2D.animation:  # Avoid restarting the animation if it's already playing
		$AnimatedSprite2D.play(anim)

func handle_idle():
	if last_direction == Vector2(-1, 0):
		$AnimatedSprite2D.play("idle left")
	if last_direction == Vector2(1, 0):
		$AnimatedSprite2D.play("idle right")
	if last_direction == Vector2(0, -1):
		$AnimatedSprite2D.play("idle back")
	if last_direction == Vector2(0, 1):
		$AnimatedSprite2D.play("idle front")
			
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = move_toward(velocity.y, 0, SPEED)

func walk():
	if walking and not playing:
		$FootstepPlayer.play()
		playing = true
	elif not walking and playing:
		$FootstepPlayer.stop()
		playing = false

func get_animation_from_direction(direction: Vector2) -> String:
	if direction:	
		if direction == Vector2(-1, 0):
			$AnimatedSprite2D.play("walk left")
		if direction == Vector2(1, 0):
			$AnimatedSprite2D.play("walk right")
		if direction == Vector2(0, -1):
			$AnimatedSprite2D.play("walk back")
		if direction == Vector2(0, 1):
			$AnimatedSprite2D.play("walk front")
		
	return ""

