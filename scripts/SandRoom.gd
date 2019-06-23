extends Node2D

var class_Sandcoll = preload("res://entities/SandColl.tscn")

export var size : int = 700
var array_sandcoll = []

func _ready():
	for i in range(size):
		var newSandColl = class_Sandcoll.instance()
		if array_sandcoll:
			array_sandcoll[-1].right_sandcoll = newSandColl
			newSandColl.left_sandcoll = array_sandcoll[-1]
		newSandColl.position.x += len(array_sandcoll)
		newSandColl.breached = true if len(array_sandcoll) == 110 || len(array_sandcoll) == 300 else false
		array_sandcoll.append(newSandColl)
		add_child(newSandColl)