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
		"down", "up":
			anim.animation = "simple_v"
			return "simple_v"
		"left":
			anim.animation = "curve_right"
			return "simple_h"
		"right":
			anim.animation = "curve_left"
			return "simple_h"
	
	return ""
