extends RigidBody2D


var jump_force=100
var is_jump=false
var bullet=preload("res://bullet.tscn")
var isshooting=false


#sounds
onready var audio=get_node("AudioStreamPlayer2D")

var lose=preload("res://Sounds/Lose.wav")
var jump=preload("res://Sounds/jump.wav")
var soot=preload("res://Sounds/Shoot.wav")


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite").play("run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	if Input.is_action_pressed("jump") and is_jump==false:
		is_jump=true
		set_axis_velocity(Vector2(0,-jump_force))
		get_node("AnimatedSprite").play("jump")
		audio.stream=jump
		audio.play()
	if Input.is_action_pressed("slide"):
		get_node("AnimatedSprite").play("crouch")
	if Input.is_action_just_released("slide"):
		get_node("AnimatedSprite").play("run")
	if Input.is_action_pressed("shoot") and isshooting==false:
		shoot()
		isshooting=true
	if Input.is_action_just_released("shoot"):
		isshooting=false



func _on_character_body_entered(body):
	if body.get_parent().is_in_group("Ground"):
		is_jump=false
		get_node("AnimatedSprite").play("run")
	else:
		get_node("AnimatedSprite").play("death")
		audio.stream=lose
		audio.play()
		get_tree().quit()
func die():
	audio.stream=lose
	audio.play()
	get_node("AnimatedSprite").play("death")
	get_tree().quit()
	
	
func shoot():
	var b=bullet.instance()
	b.position=get_node("bulletposition").get_global_position()
	audio.stream=soot
	audio.play()
	print(b.position)
	get_parent().add_child(b)
