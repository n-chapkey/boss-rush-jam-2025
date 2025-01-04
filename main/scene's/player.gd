extends CharacterBody2D

@onready var hitbox_player = $CollisionShape2D
var dir:String = "none"
var is_moving:bool = false
@onready var anim = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var player_damage_attack : int = 10
@export var player_health_max : int = 100


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump_player") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 and velocity.x == 0:
			anim.play("idle")
	
	if direction == -1:
		anim.flip_h = true
		
	elif direction == 1:
		anim.flip_h = false
		
	if Input.is_action_pressed("sit") and velocity.y == 0:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("crouch")
	
	elif Input.is_action_pressed("player_attack"):
		anim.play("attack")
		
		
	
	
	
	move_and_slide()



func _on_area_2d_3_body_entered(body: CharacterBody2D) -> void:
	position.x = 2589
	position.y = 706

func player_attack() -> void:
	pass

	
