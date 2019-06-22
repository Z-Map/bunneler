extends KinematicBody2D

var snap := false
export (int) var speed = 50
export (int) var gravity = 900
export (int) var dash_distance = 30
var velocity := Vector2()

var target := Vector2()

func _process(delta):
	if Input.is_action_pressed("ui_down") && !Input.is_action_pressed("ui_up"):
		target.y = 1
	elif Input.is_action_pressed("ui_up") && !Input.is_action_pressed("ui_down"):
		target.y = -1
	else:
		target.y = 0
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		target.x = 1
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		target.x = -1
	else:
		target.x = 0

func _physics_process(delta: float):
	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * speed if is_on_floor() else velocity.x
	velocity.y += gravity * delta

	var space_state = get_world_2d().direct_space_state
	if is_on_floor() && Input.get_action_strength("dash") && target != Vector2(0, 0):
		var ray_target = position + (target * dash_distance)
		print_debug(ray_target)
		var result = space_state.intersect_ray(position, ray_target, [self])
		if result:
			position = result.position
		else:
			position = ray_target
			

	var snap_vector = Vector2(0, 32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector2.UP, true)

	if is_on_floor() and not snap:
		snap = true

func _draw():
	draw_line(position, position + (target * 100), Color.crimson, 2.0)