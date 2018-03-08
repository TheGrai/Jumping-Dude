extends KinematicBody2D
const GRAVITY = 20
const JUMP_HEIGHT = -550
const ACCELERATION = 50
const MAX_SPEED = 200
const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		motion.x = 0
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Falling")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

	if motion.y :
		pass
	
#	if move_and_slide(linear_velocity) < 0:
#		$Sprite.play("Falling")
		
	if position.y > 500:
		position.y = 0
		position.x = 200
		motion.y = 0
	
	motion = move_and_slide(motion, UP)
	pass








