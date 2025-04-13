extends Node2D


# Declare member variables here. Examples:
onready var animatedsprite=get_node("AnimatedSprite")

var isdead=false

# Called when the node enters the scene tree for the first time.
func _ready():
	 animatedsprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name=="character":
		body.die()
		get_tree().quit()


func _on_Area2D_area_entered(area):
	if  area.is_in_group("bullets"):
		dead()
		area.get_parent().queue_free()


func dead():
	animatedsprite.play("death")
	isdead=true

func reset():
	animatedsprite.play("idle")
	isdead=false
