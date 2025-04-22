extends CharacterBody2D

class_name Bird

@export var gravity = 900.0
@export var jump_force = -300
@export var rotation_speed = 2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var max_speed = 400
var is_started = false

func _ready() -> void:
	velocity = Vector2.ZERO
	animation_player.play("idle")
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("jump"):
		if not is_started: is_started = true
		jump()
	
	if not is_started: return
	
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	
	move_and_collide(velocity * delta)
	
	rotate_bird()
	


func jump():
	velocity.y = jump_force
	print(velocity.y)
	rotation = deg_to_rad(-30)
	

func rotate_bird():
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)
	
