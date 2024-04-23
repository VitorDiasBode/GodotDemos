extends Node2D

var editing = true
var pipe_type_index = 0
onready var current_pipe_type = $Type.get_child(pipe_type_index)

func _process(delta):
	if editing:
		global_position.x = (int(get_global_mouse_position().x / 32)+1) * 32
		global_position.y = (int(get_global_mouse_position().y / 32)+1) * 32

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			set_pipe()
			return
		if event.button_index == 2 and event.pressed:
			change_pipe_type()
			return
	
	if event.is_action_pressed("ui_right"):
		change_pipe_rotation(true)
	elif event.is_action_pressed("ui_left"):
		change_pipe_rotation(false)

func change_pipe_type():
	current_pipe_type.hide()
	current_pipe_type.get_node("Area2D").monitorable = false
	
	pipe_type_index += 1
	if pipe_type_index >= $Type.get_child_count():
		pipe_type_index = 0
	
	current_pipe_type = $Type.get_child(pipe_type_index)
	current_pipe_type.show()
	current_pipe_type.get_node("Area2D").monitorable = true

func change_pipe_rotation(clockwise:bool):
	if clockwise:
		current_pipe_type.rotation_degrees += 90
	else:
		current_pipe_type.rotation_degrees -= 90

func set_pipe():
	var pipe_end_area = current_pipe_type.get_node("Area2D")
	if pipe_end_area.get_overlapping_areas().size() > 0:
		editing = false
		get_parent().pipe = null
		set_process_input(false)
		set_process(false)

