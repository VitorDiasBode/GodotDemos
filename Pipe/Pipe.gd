extends Node2D

export var current_pipe_type:NodePath

func _ready():
	if current_pipe_type == NodePath():
		set_pipe("none")
	else:
		set_pipe("")

func set_connection(new_pipe_direction:String):
	return get_node(current_pipe_type).set_conection(new_pipe_direction)

func set_pipe(new_pipe_type:String):
	if new_pipe_type == "":
		new_pipe_type = get_node(current_pipe_type).initial_type
	
	$AnimatedSprite.animation = new_pipe_type
