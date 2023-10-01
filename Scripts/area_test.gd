extends CharacterBody2D

func _ready():
	pass

func _process(_delta):
	pass

func _draw():
	draw_circle(Vector2(0,0), $Area2D/CollisionShape2D.shape.radius,
		Color(1,1,1,0.2))
