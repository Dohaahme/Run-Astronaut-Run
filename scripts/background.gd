extends Node2D

var sets = []
export var limit = 685
export var limitOffset = 2.8
export var speed = 60
var randomGenerator = RandomNumberGenerator.new()
var randomIndex = 0

func selsectRandomObstcale():
	randomGenerator.randomize()
	randomIndex = randomGenerator.randi_range(0,sets.size()-1)
	sets[randomIndex].get_node("align").reset()
	add_child(sets[randomIndex])

func _ready():
	for child in get_children():
		if child.is_in_group("sets"):
			sets.append(child)
			remove_child(child)
	selsectRandomObstcale()
	
	
func _process(delta):

	translate(Vector2(-speed*delta,0))
	if position.x <-limit:
			position.x = limit - limitOffset
			remove_child(sets[randomIndex])
			selsectRandomObstcale()
