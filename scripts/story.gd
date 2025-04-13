extends Control


onready var textlabel=get_node("ColorRect/RichTextLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	textlabel.percent_visible=0
	get_node("ColorRect/Button").visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	textlabel.percent_visible+=(0.04*delta)
	if textlabel.percent_visible==1:
		get_node("ColorRect/Button").visible=true


func _on_Button_pressed():
	get_tree().paused=false
	get_tree().change_scene("res://main.tscn")
