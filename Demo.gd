extends Node2D

var load_pipe = load("res://Pipe.tscn")
var pipe

func _input(event):
	if event.is_action_pressed("ui_accept"):
		create_pipe()

func create_pipe():
	if is_instance_valid(pipe):
		return
	
	pipe = load_pipe.instance()
	add_child(pipe)


