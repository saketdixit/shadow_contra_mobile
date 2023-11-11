extends Node2D

@onready var this = $'.'


# Called when the node enters the scene tree for the first time.
func _ready():
	var up_button = this.get_child(0)
	var right_button = this.get_child(1)
	var down_button = this.get_child(2)
	var left_button = this.get_child(3)
	
	#rotate the buttons to be accurate
	right_button.get_child(0).rotation += 1.5708
	down_button.get_child(0).rotation += 3.14159
	left_button.get_child(0).rotation += 4.71239
	
	for movement_button in this.get_children():
		movement_button.pressed.connect(_on_movement_button_pressed)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Learn how to pass an argument to this callback function from line 18
func _on_movement_button_pressed():
	print("movement_button")
