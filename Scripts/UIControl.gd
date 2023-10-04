extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuButton.get_popup().add_item("Quit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_button_up():
	get_tree().quit()
