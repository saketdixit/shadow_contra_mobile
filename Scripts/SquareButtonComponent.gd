extends TouchScreenButton


@onready var this_button = $'.'
@onready var button_icon = get_child(0) 
@export var embedded_icon = load("res://Assets/Sprites/Up-Down.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if(embedded_icon):
		button_icon.set_texture(embedded_icon)
	else:
		button_icon.set_texture("res://Assets/Sprites/default_icon.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	print("Button Pressed!")


func _on_released():
	pass # Replace with function body.
