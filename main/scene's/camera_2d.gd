extends Camera2D

func _ready() -> void:
	position.x = 578


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	position.x = 800
	await get_tree().create_timer(0.1).timeout
	position.x = 1000
	await get_tree().create_timer(0.1).timeout
	position.x = 1200
	await get_tree().create_timer(0.1).timeout
	position.x = 1727


func _on_area_2d_2_body_entered(body: CharacterBody2D) -> void:
	rotation_degrees = 180
	await get_tree().create_timer(10.0).timeout
	rotation_degrees = 360
