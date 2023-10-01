extends Area2D

var isAlive
var botInArea
var rcv_click = false
var pub_col
var py_sprite

func _ready():
	pub_col = self.get_parent().get_node('pub/pub_col1')
	py_sprite = self.get_parent().get_node('rcv/Sprite2D')
	isAlive = not self.get_parent().get_node('pub/pub_col1').disabled
	botInArea=-1

func _process(_delta):
	pass
		
	
func _unhandled_input(_event):
	if Input.is_action_pressed("start"):
		$Timer.start()
	
func _on_timer_timeout():
	isAlive = not self.get_parent().get_node('pub/pub_col1').disabled
	# isAlive = not pub_col.get_deferred('disabled')
	# 復活
	if not isAlive and botInArea==3:
		pub_col.set_deferred('disabled', false)
		py_sprite.set_deferred('visible', true)
	# 族群過小死亡
	elif isAlive and botInArea<2:
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
		botInArea-=1
	# 族群過大死亡
	elif isAlive and botInArea>3:
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
		botInArea-=1

func _on_area_entered(_area):
	botInArea+=1

func _on_area_exited(_area):
	botInArea-=1

func _on_mouse_entered():
	rcv_click = true

func _on_mouse_exited():
	rcv_click = false

# func _draw():
# 	var col_rec = Rect2(pub_col.get_parent().position, pub_col.shape.size)
# 	draw_rect(col_rec, Color(1,1,1,0.2), false, 1)

func _on_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if Input.is_action_just_pressed("right click"):
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
	elif Input.is_action_just_pressed("left click"):
		print(botInArea)
		pub_col.set_deferred('disabled', false)
		py_sprite.set_deferred('visible', true)
