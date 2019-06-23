extends StaticBody2D

var sand_quantity : float = 0.0
var breached : bool = false
var left_sandcoll = null
var right_sandcoll = null


func _process(delta):
	$CollisionShape2D.scale.y = 0.05 * sand_quantity
	$CollisionShape2D.position.y = -(sand_quantity/2)

func _on_Timer_timeout():
	var randomeuh = rand_range(0, 1)
	if randomeuh > 0.5 && left_sandcoll && left_sandcoll.sand_quantity < sand_quantity:
		sand_quantity -= 1.0
		left_sandcoll.sand_quantity += 1.0
	if randomeuh < 0.5 && right_sandcoll && right_sandcoll.sand_quantity < sand_quantity:
		sand_quantity -= 1.0
		right_sandcoll.sand_quantity += 1.0
	if breached:
		sand_quantity += 1.0
	
#	print_debug(sand_quantity)
#	print_debug($CollisionShape2D.position.y)
#	print_debug($CollisionShape2D.scale.y)
