extends Sprite3D

var coins = 5
var player_name = "robot"
var hearts = 3.5
const SPEED = 2
var x = coins + 1
var is_gadot_awesome = true
var key_collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_inputs()

func minion():
	print("Poop")

func add_these_numbers(x, y):
	var sum = x + y
	return sum

func check_inputs():
	if Input.is_action_pressed("ui_left"):
		rotate_y(deg_to_rad(-SPEED))
	elif Input.is_action_pressed("ui_right"):
		rotate_y(deg_to_rad(SPEED))
