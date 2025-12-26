extends CharacterBody2D
class_name Player

const GRAVITY = 500.0
const WALK_SPEED = 200
const JUMP_FORCE = -330.0

func _ready() -> void:
	scale *= 4

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		jump()

func jump() -> void:
	if is_on_floor():
		self.velocity.y = JUMP_FORCE

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	move_and_slide()
