extends CharacterBody3D

var speed = 2.0

@export var direction := Vector3(1,0,0)
@export var turns_around_at_edges := true
var turning := false

func _physics_process(delta: float) -> void:
	
	velocity.x = speed * direction.x
	velocity.z = speed * direction.z
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
	
	if is_on_wall() and not turning:
		turn_around()
	
	if not $RayCast3D.is_colliding() and is_on_floor() and not turning:
		turn_around()
	


func turn_around():
	turning = true
	var dir = direction
	direction = Vector3.ZERO
	var turn_tween = create_tween()
	
	turn_tween.tween_property(self, "rotation_degrees", Vector3(0, 180, 0), 0.6).as_relative()
	await get_tree().create_timer(0.6).timeout
	
	direction.x = dir.x * -1
	direction.z = dir.z * -1
	turning = false
	

func _on_sides_checker_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	


func _on_top_checker_body_entered(body: Node3D) -> void:
	$AnimationPlayer.play("squash")
	body.bounce()
	$SidesChecker.set_collision_mask_value(1, false)
	$TopChecker.set_collision_mask_value(1, false)
	direction = Vector3.ZERO
	speed = 0
	
	await get_tree().create_timer(0.6).timeout
	queue_free()
	
	
	
	
	
