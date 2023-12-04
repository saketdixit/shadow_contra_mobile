extends CharacterBody2D
#@onready var godot_essentials_platformer_movement_component: GodotEssentialsPlatformerMovementComponent = $GodotEssentialsPlatformerMovementComponent

@onready var player_ui = $".."

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var CURRENT_HEALTH = 5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var aim_tracker = $AimTracker

var screen_size
var input_vector: Vector2
var aim_direction: Vector2


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	#get the joystick
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump. 
	if input_vector.y == -1  and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#If using square controls
	if input_vector.x:
		velocity.x = input_vector.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	'''var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	'''
	
	#If using joystick
	'''
	var joystick = player_controls.get_child(5)
	var direction = joystick.posVector
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity=Vector2(0,0)'''
	
	#rotate the aim tracker to the right position
	
	aim_direction = player_ui.aim_vector
	if(aim_direction):
		var aim_angle = atan2(aim_direction.x, -aim_direction.y)
		aim_tracker.set_rotation(aim_angle)
	
	#print(aim_tracker.rotation_degrees)
	
	move_and_slide()

func _on_player_ui_movement_button_action(side):
	input_vector.x = side.x
	input_vector.y = side.y

func player_take_damage(damage):
	CURRENT_HEALTH -= damage

#func _on_player_ui_attack_button_action(side):
#	direction = side
