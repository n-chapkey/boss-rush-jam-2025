extends Control

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		show()


func _on_continue_pressed() -> void:
	hide()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/menu.tscn")
