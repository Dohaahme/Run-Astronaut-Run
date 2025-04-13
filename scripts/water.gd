extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var gameManager = get_tree().root.get_node("main")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name=="character":
		gameManager.oxygen +=20
		visible=false
