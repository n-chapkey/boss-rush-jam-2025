extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_area_2d_4_body_entered(body: CharacterBody2D) -> void:
	play("idle")
	await get_tree().create_timer(5).timeout
	play("walk")
	await get_tree().create_timer(5).timeout
	play("idle")
