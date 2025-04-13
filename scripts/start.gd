extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Control").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	get_node("Control").visible=true




func _on_exit_pressed():
	get_tree().quit()


func _on_TextureButton_toggled(button_pressed):
	var master_sound=AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_sound,button_pressed)
	
