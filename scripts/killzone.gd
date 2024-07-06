extends Area2D

@onready var timer = $Timer
var Body

func _on_body_entered(body):
	Body = body
	timer.start()

func _on_timer_timeout():
	print("You Died!")
	Body.get_node("CollisionShape2D").queue_free()
	get_tree().reload_current_scene()
