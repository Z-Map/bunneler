extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bg_frame = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bg_animation_timeout():
	if bg_frame >= 25:
		bg_frame = 1
	else:
		bg_frame += 1
	$background.frame = bg_frame
