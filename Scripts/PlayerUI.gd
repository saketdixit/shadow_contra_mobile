extends Node2D

@onready var player_controls = $"PlayerControl"
signal movement_button_action(side: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_movement_controls = player_controls.get_child(6)
	var up_button = player_movement_controls.get_child(0)
	var right_button = player_movement_controls.get_child(1)
	var down_button = player_movement_controls.get_child(2)
	var left_button = player_movement_controls.get_child(3)
	
	up_button.pressed.connect(_on_movement_button_action.bind(Vector2(0,-1)))
	right_button.pressed.connect(_on_movement_button_action.bind(Vector2(1,0)))
	down_button.pressed.connect(_on_movement_button_action.bind(Vector2(0,1)))
	left_button.pressed.connect(_on_movement_button_action.bind(Vector2(-1,0)))
	
	up_button.released.connect(_on_movement_button_action.bind(Vector2(0,0)))
	right_button.released.connect(_on_movement_button_action.bind(Vector2(0,0)))
	down_button.released.connect(_on_movement_button_action.bind(Vector2(0,0)))
	left_button.released.connect(_on_movement_button_action.bind(Vector2(0,0)))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_movement_button_action(side: Vector2):
	movement_button_action.emit(side)
