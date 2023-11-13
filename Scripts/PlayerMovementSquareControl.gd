extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var up_button = self.get_child(0)
	var right_button = self.get_child(1)
	var down_button = self.get_child(2)
	var left_button = self.get_child(3)
	
	#rotate the buttons to be accurate
	right_button.get_child(0).rotation += 1.5708
	down_button.get_child(0).rotation += 3.14159
	left_button.get_child(0).rotation += 4.71239
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

