extends Node2D

var load_pipe = load("res://Pipe/Pipe.tscn")
var pipe

func _ready():
	create_pipe()

func _process(delta):
	global_position.x = (int(get_global_mouse_position().x / 32)) * 32
	global_position.y = (int(get_global_mouse_position().y / 32)) * 32
	pipe.global_position = global_position

func _on_Area2D_area_entered(area:Area2D, direction:String):
	if area.is_in_group("Pipe"):
		var new_pipe_type = area.owner.set_connection(direction)
		pipe.set_pipe(new_pipe_type)

func _on_Area2D_area_exited(area):
	if area.is_in_group("Pipe"):
		area.owner.set_pipe("")
		pipe.set_pipe("none")

func create_pipe():
	pipe = load_pipe.instance()
	get_parent().call_deferred("add_child", pipe)
