extends CharacterBody2D

@onready var player_controls = $"../PlayerControl"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#get the joystick
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	'''var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	'''
	#If using joystick
	'''var joystick = player_controls.get_child(5)
	var direction = joystick.posVector
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity=Vector2(0,0)'''
	
	#If using square controls
	var direction = Input.get_axis("ui_left", "ui_right")
	var movement_square_buttons = player_controls.get_child(6)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
