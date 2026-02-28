extends CharacterBody2D

@export var speed = 100
const pi = 3.14

func _physics_process(_delta: float) -> void:
	
	# changes rotation direction
	var rotate_amount = 0
	if Input.is_action_pressed("ui_left") and rotation_degrees < 75:
		rotate_amount += pi/24
	if Input.is_action_pressed("ui_right") and rotation_degrees > -75:
		rotate_amount -= pi/24
	rotate(rotate_amount)
	# changes velocity based on current direction
	velocity = transform.y * speed
	
	# moves character
	move_and_slide()
