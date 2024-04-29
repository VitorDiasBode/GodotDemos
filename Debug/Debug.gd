extends Control

func d_print(msg:String):
	$ScrollContainer/VBoxContainer/Label.text += "\n"+msg
	yield(get_tree().create_timer(0.09),"timeout" )
	$ScrollContainer.get_v_scrollbar().value = $ScrollContainer.get_v_scrollbar().max_value
