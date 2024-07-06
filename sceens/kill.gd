extends Area2D

@onready var slime = $".."
@onready var slimeSprite = $"../AnimatedSprite2D"
@onready var timer = $"../Timer"
@onready var killzone_collider = $"../Killzone/killzoneCollider"

var isIn = false

func _on_body_entered(body):
	isIn = true

func _on_body_exited(body):
	isIn = false

func _process(delta):
	if Input.is_action_just_pressed("kill_key"):
		if isIn == true:
			killzone_collider.queue_free()
			slimeSprite.play("die")
			timer.start()


func _on_timer_timeout():
	slime.queue_free()
	print("Died!")
