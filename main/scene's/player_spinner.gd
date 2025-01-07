extends Node2D

var segments = {
	"Sword": preload("res://assets/Misc/fantasy weapons set/PNG/1.png"),
	"Bow": preload("res://assets/Misc/fantasy weapons set/PNG/9.png"),
	"Magic": preload("res://assets/Misc/EnemyProjectile/Sprites/frame2.png"),
	"Axe": preload("res://assets/Misc/fantasy weapons set/PNG/7.png"),
	"Spear": preload("res://assets/Misc/fantasy weapons set/PNG/6.png"),
	"Shield": preload("res://assets/Misc/fantasy weapons set/PNG/2.png"),
	"Potion": preload("res://assets/Misc/EnemyDeath/Sprites/enemy-death1.png"),
	"Fireball": preload("res://assets/Misc/Grotto-escape-2-FX/sprites/fire-ball/_0001_Layer-2.png"),
	"Dagger": preload("res://assets/Misc/Dagger/dagger.png")
}
var radius = 200.0
var center = Vector2(0, 0)
var colors = [
	Color.RED,
	Color.BLUE,
	Color.GREEN,
	Color.YELLOW,
	Color.ORANGE,
	Color.PURPLE,
	Color.CYAN,
	Color.WHITE,
	Color.PINK,
]
var rotation_speed = 0.0
var current_rotation = 0.0
var selected_segment: int = 0

func _ready() -> void:
	center = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	var segment_angle = TAU / segments.size()
	current_rotation = -segment_angle / 2
	queue_redraw()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		rotation_speed -= 5.0 * delta
	if Input.is_action_pressed("ui_right"):
		rotation_speed += 5.0 * delta
	current_rotation += rotation_speed
	rotation_speed *= 0.95
	queue_redraw()

func _draw() -> void:
	var segment_angle = TAU / segments.size()
	var segment_keys = segments.keys()

	# Draw segments
	for i in range(segments.size()):
		var start_angle = i * segment_angle + current_rotation
		var end_angle = (i + 1) * segment_angle + current_rotation

		# Draw segment polygon
		var spinnerPoints = PackedVector2Array([center,
			center + Vector2(cos(start_angle), sin(start_angle)) * radius,
			center + Vector2(cos(end_angle), sin(end_angle)) * radius])
		var colorArray = PackedColorArray([colors[i], colors[i], colors[i]])
		draw_polygon(spinnerPoints, colorArray)

		# Draw icons
		var label_angle = start_angle + segment_angle / 2
		var label_pos = center + Vector2(cos(label_angle), sin(label_angle)) * (radius * 0.7)
		var texture = segments[segment_keys[i]]
		if texture is Texture2D:
			draw_texture(texture, label_pos - Vector2(texture.get_width(), texture.get_height()) / 2)
	
	# Draw pointer (moved outside segment loop)
	var pointer_size = 40.0
	var pointer_outline_size = 50.0
	var pointer_color = get_pointer_color()

	# Draw pointer outline
	var pointer_outline_points = PackedVector2Array([
		center + Vector2(0, -radius + pointer_outline_size),
		center + Vector2(-pointer_outline_size / 2, -radius),
		center + Vector2(pointer_outline_size / 2, -radius)
	])
	draw_colored_polygon(pointer_outline_points, Color.BLACK)

	# Draw pointer fill
	var pointer_fill_points = PackedVector2Array([
		center + Vector2(0, -radius + pointer_size),
		center + Vector2(-pointer_size / 2, -radius),
		center + Vector2(pointer_size / 2, -radius)
	])
	draw_colored_polygon(pointer_fill_points, pointer_color)

func get_pointer_color() -> Color:
	var segment_angle = TAU / segments.size()
	var normalized_rotation = fmod(current_rotation, TAU)
	if normalized_rotation < 0:
		normalized_rotation += TAU
	
	# Calculate which segment is at the top (PI instead of PI/2)
	var top_segment = int(floor((1.5*PI - normalized_rotation) / segment_angle)) % segments.size()
	if top_segment < 0:
		top_segment += segments.size()
	
	selected_segment = top_segment
	return colors[selected_segment]
