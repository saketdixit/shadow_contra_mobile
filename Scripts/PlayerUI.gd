extends Node2D

@onready var player_controls = $ScreenUI/PlayerControl
var aim_vector: Vector2 = Vector2(0,0)
signal movement_button_action(side: Vector2)
signal attack_button_action(side: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#get Player Movement Controls and assign them to appropriate movement commands
	var player_movement_controls = player_controls.get_child(2)
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
	
	#get the basic attack joystick position for aiming
	var player_attack_joystick_button = player_controls.get_child(0).get_child(0).get_child(0) #this is the touchscreenbutton node
	player_attack_joystick_button.pressed.connect(_on_attack_button_action.bind(player_attack_joystick_button.get_child(1).posVector))
	#player_attack_joystick_button.released.connect(_on_attack_button_action.bind(Vector2(0,0)))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_attack_joystick = player_controls.get_child(0).get_child(0).get_child(0).get_child(1) #this is the movementstick node
	aim_vector = player_attack_joystick.posVector

#this will release a signal to be observed by the player character
func _on_movement_button_action(side: Vector2):
	movement_button_action.emit(side)

func _on_attack_button_action(side: Vector2):
	print(side)
	attack_button_action.emit(side)
