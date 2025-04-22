extends CharacterBody2D


var window_size : Vector2

const START_SPEED : int = 200
const ACCELERATION : int = 50

var speed : int
var direction : Vector2

func _ready() -> void:
	window_size = get_viewport_rect().size
	

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction*speed*delta)
	
	if collision:
		var collider = collision.get_collider()
		
		if collider == $"../PlayerPaddle":
			speed += ACCELERATION
		
		direction = direction.bounce(collision.get_normal())
		
	

func spawn_ball():
	position.x = window_size.x/2
	position.y = window_size.y/2
	
	speed = START_SPEED
	direction = set_direction()
	

func set_direction():
	var new_direction = Vector2()
	
	new_direction.x = [1,-1].pick_random()
	new_direction.y = randf_range(-1,1)
	
	return new_direction.normalized()
