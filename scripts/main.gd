extends Node2D

var oxygen=50
onready var sceneUI=get_node("mainui")
onready var oxygenText=sceneUI.get_node("oxygen")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	oxygen-=delta
	if oxygen<=0:
		get_node("character").die()
	else:
		oxygenText.text="oxygen"+str(int(oxygen))



