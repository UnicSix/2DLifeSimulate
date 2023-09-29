extends Area2D


var isAlive
var botInArea
# Called when the node enters the scene tree for the first time.
func _ready():
	isAlive = false
	botInArea=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if not isAlive and botInArea>=3:
		isAlive = true
		self.visible=true

	elif isAlive and botInArea<2:
		isAlive = false
		self.visible=false

	elif isAlive and botInArea>3:
		isAlive = true
		self.visible=true




func _on_area_entered(area):
	if area.isAlive:
		botInArea+=1
		print(botInArea)


func _on_area_exited(area):
	pass # Replace with function body.
