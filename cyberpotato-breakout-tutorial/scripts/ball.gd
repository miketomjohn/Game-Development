extends CharacterBody2D

class_name Ball

signal life_lost

const VELOCITY_LIMIT = 30

@export var ball_speed = 15
@export var lives = 3
@export var death_zone: DeathZone
@export var ui: UI

var speed_up_factor = 1.05
var start_position: Vector2
var last_collider_id

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	ui.set_lives(lives)
	start_position = position
	death_zone.life_lost.connect(on_life_lost)
	

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * ball_speed * delta)
	
	if !collision:
		return
	
	var collider = collision.get_collider()
	if collider is Brick:
		collider.decrease_level()
	
	if (collider is Paddle):
		ball_collision(collider)
	else:
		if collider.get_rid() == last_collider_id && collider is Brick:
			velocity = Vector2(deg_to_rad(randf_range(-70, 70)) * velocity.x, -velocity.y)
		elif collider is Brick:
			velocity = velocity.bounce(collision.get_normal())
			last_collider_id = collider.get_rid()
		else:
			velocity = velocity.bounce(collision.get_normal())
	

func start_ball():
	position = start_position
	
	velocity = Vector2(randf_range(-1, 1), randf_range(-0.1, -1)).normalized() * ball_speed
	

func on_life_lost():
	lives -= 1
	
	if lives == 0:
		ui.game_over()
	else:
		life_lost.emit()
		reset_ball()
		ui.set_lives(lives)
	

func reset_ball():
	position = start_position
	velocity = Vector2.ZERO
	

func ball_collision(collider):
	var ball_width = collision_shape_2d.shape.get_rect().size.x
	var ball_center_x = position.x
	var collider_width = collider.get_width()
	var collider_center_x = collider.position.x
	var velocity_xy = velocity.length()
	var collision_x = ((ball_center_x - collider_center_x) * 1.1) / (collider_width / 2)
	var new_velocity = Vector2.ZERO
	var speed_multiplier = speed_up_factor if collider is Paddle else 1
	
	last_collider_id == collider.get_rid()
	
	new_velocity.x = velocity_xy * collision_x
	new_velocity.y = sqrt(absf(velocity_xy * velocity_xy - new_velocity.x * new_velocity.x)) * (-1 if velocity.y > 0 else 1)
	
	velocity = (new_velocity * speed_multiplier).limit_length(VELOCITY_LIMIT)
	
	
