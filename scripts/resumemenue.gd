extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var resume=true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_restart_pressed():
	get_tree().paused = false  # Ensure the game is unpaused
	get_tree().change_scene("res://main.tscn")


func _on_exit_pressed():
	get_tree().quit()
	resume=true

func _on_resume_pressed():
	get_tree().paused=false
	self.visible=false
	


func _on_mainmenue_pressed():
	get_tree().change_scene("res://start.tscn")
	
#the homework code 
func _input(event):
	if event.is_action_pressed("resum"):  # Listen for the Escape key
		get_tree().paused=!get_tree().paused
		self.visible=!self.visible


func _on_TextureButton_toggled(button_pressed):
	var master_sound=AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_sound,button_pressed)
