extends Camera2D

func _ready() -> void:
	position.x = 578



func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	position.x = 1727


func _on_area_2d_2_body_entered(_body: CharacterBody2D) -> void:
	rotation_degrees = 180
	await get_tree().create_timer(10.0).timeout
	rotation_degrees = 360


func _on_area_2d_3_body_entered(_body: CharacterBody2D) -> void:
	position.x = 2516
	position.y = 827
	await get_tree().create_timer(2.0).timeout
	rotation_degrees = 360


func _on_area_2d_4_body_entered(_body: CharacterBody2D) -> void:
	position.x = 3800
	position.y = 459
