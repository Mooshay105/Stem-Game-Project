extends CharacterBody2D
const SPEED = 100.0
const JUMP_VELOCITY = -325.0
var jumping = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		player.flip_h = false
	elif direction < 0:
		player.flip_h = true
	if is_on_floor():
		jumping = false
		if direction == 0:
			player.play("idle")
		else:
			player.play("run")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if velocity.y < 0:
		player.play("jump")
	else:
		if direction == 0:
			player.play("idle")
		else:
			player.play("run")
	move_and_slide()
