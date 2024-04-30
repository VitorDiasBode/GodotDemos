extends Node2D

export var current_pipe_type:NodePath

func _ready():
	if current_pipe_type == NodePath():
		current_pipe_type = "PipeTypes/simple_v"
		set_pipe("none")
	else:
		set_pipe("")

func set_connection(new_pipe_direction:String):
	return get_node(current_pipe_type).set_conection(new_pipe_direction)

func set_pipe(new_pipe_type:String):
	if new_pipe_type == "":
		new_pipe_type = get_node(current_pipe_type).initial_type
	
	$AnimatedSprite.animation = new_pipe_type
#	Debug.d_print("current pipe type: "+current_pipe_type)
#	Debug.d_print("current animation: "+$AnimatedSprite.animation)
#	Debug.d_print("----------------")

func set_pipe_type():
	current_pipe_type = "PipeTypes/"+$AnimatedSprite.animation
