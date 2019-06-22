extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var player_target: NodePath
export(NodePath) var background_target: NodePath

var player: Node2D = null
var background: Sprite = null
var bg_frame = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if not player_target.is_empty():
		player = get_node(player_target)
	if not background_target.is_empty():
		background = get_node(background_target)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		var p_pos = player.transform.origin
		transform.origin.x = p_pos.x
		if background:
			background.transform.origin.x = transform.origin.x - (transform.origin.x / 10)
		if p_pos.y > transform.origin.y + 16:
			transform.origin.y = p_pos.y - 16
		elif p_pos.y < transform.origin.y - 256:
			transform.origin.y = p_pos.y + 256

