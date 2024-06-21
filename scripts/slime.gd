extends Node2D

const SPEED = 60
var direction = 1
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var slime = $AnimatedSprite2D

func _process(deltaTime):
	if ray_cast_left.is_colliding():
		direction = 1
		slime.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		slime.flip_h = true
	
	position.x += direction * SPEED * deltaTime
