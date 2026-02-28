extends CharacterBody2D

@export var speed = 100
const pi = 3.14

func _physics_process(delta: float) -> void:
	
	# changes rotation direction
	if Input.is_action_pressed("ui_left") and rotation_degrees < 75:
		rotate(pi/24)
	elif Input.is_action_pressed("ui_right") and rotation_degrees > -75:
		rotate(-pi/24)
	
	# changes velocity based on current direction
	velocity = transform.y * speed
	
	# moves character
	move_and_slide()
