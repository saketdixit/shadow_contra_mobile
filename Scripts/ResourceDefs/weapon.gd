extends Resource

class_name Weapon_Resource

@export var resource_id: int
@export var user: int #0 for Player-weapons, 1 for enemy weapons, 2 for traps
@export var projectile: Texture2D #how the actual projectile looks and is animated  
'''Change projectile var type to animation''' 
@export var damage: int #damage per collision/hit
@export var fire_rate: int #fire_rate
@export var projectile_speed: int #speed of projectile
@export var weapon_icon: Texture2D #icon to be shown on buttons, menus
@export var description: String

#this section is for achievements
@export var enemies_killed: int
