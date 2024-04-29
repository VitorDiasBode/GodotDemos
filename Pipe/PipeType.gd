class_name PipeType
extends Node2D

onready var anim = $"../../AnimatedSprite"
export var initial_type = "simple_h"
export var connections = {
	"down":["simple_v", "simple_v"],
	"left":["simple_v", "simple_v"],
	"up":["simple_v", "simple_v"],
	"right":["simple_v", "simple_v"],
}

func set_conection(direction:String):
	match direction:
		"down":
			anim.animation = connections.down[0]
			return connections.down[1]
		"up":
			anim.animation = connections.up[0]
			return connections.up[1]
		"left":
			anim.animation = connections.left[0]
			return connections.left[1]
		"right":
			anim.animation = connections.right[0]
			return connections.right[1]
	
	return ""
