extends KinematicBody2D

const MOVE_SPEED = 70
const GRAVITY = 180
const JUMP_FORCE = 160
var velocity = Vector2()

func _ready():
	$Sprite.animation = "idle"
	$Sprite.play()
	
func _process(delta):
	if Input.is_action_just_pressed("Exit"):
		get_tree().quit()
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("move_left"):
		velocity.x = -MOVE_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = MOVE_SPEED	
	else:
		velocity.x = 0
		$Sprite.animation = "idle"
	if velocity.x != 0:
		$Sprite.animation = "run"	
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_FORCE
		
	if !is_on_floor():
		$Sprite.animation = "jump"
		
	if velocity.x != 0:
		$Sprite.animation = "run"
		$Sprite.flip_v = false
		$Sprite.flip_h = velocity.x < 0
		
	velocity = move_and_slide(velocity, Vector2.UP)
