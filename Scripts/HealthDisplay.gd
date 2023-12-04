extends CenterContainer

@onready var player_character = $"../../Player"
var heartContainer: Node
# Called when the node enters the scene tree for the first time.
func _ready():
	var health_meter_icon_scene = preload("res://Assets/Sprites/mdi_heart.png")
	var player_health = player_character.CURRENT_HEALTH
	# Create a container node for the heart icons
	heartContainer = Node.new()
	
	# Add the container node to the scene tree
	add_child(heartContainer)
	# Instantiate heart icons based on current player health
	'''var heartCount = 0
	for i in range(0,player_health):
		# Instantiate a new heart icon from the scene
		var heartIcon = health_meter_icon_scene.instance()
		# Position the heart icon in a grid layout
		heartIcon.position = Vector2(heartCount * 24, 0)
		heartCount += 1
		# Add the heart icon to the container node
		heartContainer.add_child(heartIcon)'''
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
