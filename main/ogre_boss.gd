extends CharacterBody2D

#these variables are for the bosses health points and attack damage
@export var boss_health := 100
@export var boss_attack := 15
#this variable is for the bosses defense, not final
@export var boss_armor := 5

@onready var anim := $AnimatedSprite2D
const SPEED = 300.0


#this function is for when the player touches the boss, they will recieve damage
func damage_collision_player() -> void:
	pass
	

#this function should control the bosses behavior and attack patterns
func boss_behavior() -> void:
	if velocity.y == 0 and velocity.x == 0:
			anim.play("Boss_Idle")

#this function is for when the boss takes damage
func boss_take_damage_from_player() -> void:
	pass

#this function is for the damage the bosses primary attack
func boss_main_attack_damage_dealt_to_player() -> void:
	pass

#this fucntion is for the bosses ability wheel, not final
func boss_ability_wheel() -> void:
	pass
