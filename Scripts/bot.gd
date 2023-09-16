extends CharacterBody2D


const SPEED = 10.0
var rd = RandomNumberGenerator.new()
var botInArea=0
var isAlive = true

func _ready():
	velocity.x = rd.randf_range(-5.0, 5.0)*SPEED 
	velocity.y = rd.randf_range(-5.0, 5.0)*SPEED 



func _physics_process(_delta):
	draw_circle(position, $Area2D/CollisionShape2D.shape.radius,
		Color(1,1,1,0.2))
	$botNum.text = str(botInArea)
	if not isAlive:
		velocity = Vector2.ZERO
	_life_span()
	move_and_slide()


func _on_move_dirc_timer_timeout():
	velocity.x = rd.randf_range(-5.0, 5.0)*SPEED 
	velocity.y = rd.randf_range(-5.0, 5.0)*SPEED 


func _on_area_2d_area_entered(_area):
	botInArea+=1

func _on_area_2d_area_exited(_area):
	botInArea-=1

func _life_span():
	if not isAlive and botInArea>=3:
		isAlive = true
		$Alive.visible=true
		$Dead.visible=false

	elif isAlive and botInArea<2:
		isAlive = false
		$Alive.visible=false
		$Dead.visible=true

	elif isAlive and botInArea>3:
		isAlive = true
		$Alive.visible=true
		$Dead.visible=false

func _rvs_vel():
	if position.x>1280 or position.y>720 or position.x<0 or position.y<0:
		velocity = -velocity
