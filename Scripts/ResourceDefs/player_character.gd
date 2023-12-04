extends Resource

class_name Player_Character_Resource

@export var resource_id: int
@export var character_name: String
@export var splash_art: Texture2D
@export var game_model: Texture2D
@export var description: String
'''@export var animationlibrary'''
@export var total_health: int
@export var passive: Script
@export var weapon: Resource
@export var ability: Resource

#achievements
@export var enemies_killed: int
