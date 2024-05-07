extends Node2D

var load_pipe = load("res://Pipe/Pipe.tscn")
var pipe
var nearby_pipe
var is_ready_to_place_pipe = false

func _ready():
	create_pipe()

func _process(delta):
	if is_instance_valid(pipe):
		print(pipe.current_pipe_type)
	global_position.x = (int(get_global_mouse_position().x / 32)) * 32
	global_position.y = (int(get_global_mouse_position().y / 32)) * 32
	pipe.global_position = global_position

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			if nearby_pipe != null:
				place_pipe()

func _on_Area2D_area_entered(area:Area2D, direction:String):
	if area.is_in_group("Pipe"):
		nearby_pipe = area.owner
		var new_pipe_type = nearby_pipe.set_connection(direction)
		pipe.set_pipe(new_pipe_type)
			

func _on_Area2D_area_exited(area):
	if area.is_in_group("Pipe"):
		area.owner.set_pipe("")
		pipe.set_pipe("none")
		nearby_pipe = null

func create_pipe():
	pipe = load_pipe.instance()
	get_parent().call_deferred("add_child", pipe)

func place_pipe():
	nearby_pipe.set_pipe_type()
	pipe.set_pipe_type()
	pipe = null
	create_pipe()
