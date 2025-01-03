extends AudioStreamPlayer

var stop = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_check_button_pressed() -> void:
	if stop == true:
		stream_paused = true
		stop = false
	else:
		stream_paused = false
		stop = true
