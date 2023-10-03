extends Node2D

@onready var bot = preload("res://Nodes/bot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(_event):
	if Input.is_action_just_pressed("add new"):
		var new_bot = bot.instantiate()
		new_bot.position = get_global_mouse_position()
		add_child(new_bot)
	if Input.is_action_just_pressed('restart'):
		get_tree().reload_current_scene()
