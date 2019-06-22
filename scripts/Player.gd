extends KinematicBody2D

var snap := false
var acceleration := 10
var max_speed := 350
var jump_force := 500
var gravity := 900
var slope_slide_threshold := 50.0
var velocity := Vector2()

func _physics_process(delta: float):
	if Input.get_action_strength("ui_right"):
		if velocity.x < 20:
			velocity.x = 20
		elif velocity.x < max_speed:
			velocity.x += acceleration
		else:
			velocity.x = max_speed
	elif Input.get_action_strength("ui_left"):
		if velocity.x > -20:
			velocity.x = -20
		elif velocity.x > -max_speed:
			velocity.x -= acceleration
		else:
			velocity.x = -max_speed
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("ui_up") and snap:
		velocity.y = -jump_force
		snap = false
	
	velocity.y += gravity * delta
	
	var snap_vector = Vector2(0, 32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector2.UP, slope_slide_threshold)
	
	if is_on_floor() and ( Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left") ):
		velocity.y = 0

	if is_on_floor() and not snap:
		snap = true
