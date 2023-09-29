extends Node2D

@onready var player = preload("res://Nodes/player.tscn")
var rd = RandomNumberGenerator.new()
var pos_tran = Transform2D()
var rdBoundx = (WIDTH_PX / GRID_UNIT)-1
var rdBoundy = (HEIGHT_PX / GRID_UNIT)
var spawn_pos #= Vector2(GRID_UNIT*rd.randi_range(-rdBoundx, rdBoundx), GRID_UNIT*rd.randi_range(-rdBoundy, rdBoundy))
const WIDTH_PX = 1920
const HEIGHT_PX = 1080
const GRID_UNIT = 32
var valid_pos = [[]]
var isSpawned = false

# Called when the node enters the scene tree for the first time.
func _ready():
	isSpawned=true
	for i in rdBoundx:
		valid_pos.append([])
		for j in rdBoundy:
			valid_pos[i].append(Vector2((i+1)*GRID_UNIT, (j+1)*GRID_UNIT))
			#self.get_parent().call_deferred("add_child", py)
	for i in rdBoundx:
		for j in rdBoundy:
			var py = player.instantiate()
			py.position = valid_pos[i][j]
			py.visible = false
			call_deferred("add_child", py)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _unhandled_input(_event):
	if Input.is_action_pressed("left click") and not isSpawned:
		isSpawned = true
		for i in rdBoundx:
			for j in rdBoundy:
				var py = player.instantiate()
				py.position = valid_pos[i][j]
				call_deferred("add_child", py)
