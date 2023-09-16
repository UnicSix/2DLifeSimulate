extends CharacterBody2D


const SPEED = 10.0
var rd = RandomNumberGenerator.new()

func _start():



func _physics_process(delta):
	move_and_slide()


func _on_move_dirc_timer_timeout():
	velocity.x = rd.randf_range(-5.0, 5.0)*SPEED 
	velocity.y = rd.randf_range(-5.0, 5.0)*SPEED 
