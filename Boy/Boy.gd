extends CharacterBody2D
class_name Player

@export var ACCELERATION = 500
@export var MAX_SPEED = 80
@export var FRICTION = 500

#var velocity = Vector2.ZERO

@onready var animatedSprite = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		if input_vector.x != 0:
			animatedSprite.scale.x = -sign(input_vector.x)
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
