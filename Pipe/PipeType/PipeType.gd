class_name PipeType
extends Node2D

onready var anim = $"../../AnimatedSprite"
export var pipe_sprite = ""
export var connections = {
	"down":["", ""],
	"left":["", ""],
	"up":["", ""],
	"right":["", ""],
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
