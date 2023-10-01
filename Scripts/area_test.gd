extends Area2D

var botInArea
var pub_col
var rcv_col
func _ready():
	botInArea = 0 
	pub_col = self.get_parent().get_node('pub/col1')
	rcv_col = self.get_parent().get_node('rcv/col2')


func _process(_delta):
	self.get_parent().get_node('botNum').text = str(botInArea)

func _draw():
	draw_circle(Vector2(0,0), pub_col.shape.radius,
		Color(1,1,1,0.2))
	draw_circle(Vector2(0,0), rcv_col.shape.radius,
		Color(0,0,0,0.2))

func _unhandled_input(_event):
	if Input.is_action_just_pressed("left click"):
		pass

	if Input.is_action_just_pressed("quit"):
		get_tree().quit()



func _on_area_exited(_area:Area2D):
	botInArea-=1

func _on_area_entered(_area:Area2D):
	botInArea+=1


func _on_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if Input.is_action_just_pressed('left click'):
		pub_col.set_deferred('disabled', true)
	elif Input.is_action_just_pressed('right click'):
		pub_col.set_deferred('disabled', false)
