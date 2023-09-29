extends Node2D

var rd = RandomNumberGenerator.new()
var rdBoundx = (WIDTH_PX / GRID_UNIT)-1
var rdBoundy = (HEIGHT_PX / GRID_UNIT)
var spawn_pos #= Vector2(GRID_UNIT*rd.randi_range(-rdBoundx, rdBoundx), GRID_UNIT*rd.randi_range(-rdBoundy, rdBoundy))
const WIDTH_PX = 1920
const HEIGHT_PX = 1080
const GRID_UNIT = 32

var valid_pos = [[]]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in rdBoundx:
		valid_pos.append([])
		for j in rdBoundy:
			valid_pos[i].append(Vector2(i*GRID_UNIT, j*GRID_UNIT))
	
	for i in rdBoundx:
		for j in rdBoundy:
			print(valid_pos[i][j])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
