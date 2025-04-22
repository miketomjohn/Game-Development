extends StaticBody2D

var window_height : int
var paddle_height : int
const PADDLE_SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_height = get_viewport_rect().size.y
	paddle_height = $ColorRect.size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("player2_paddle_up"):
		position.y -= PADDLE_SPEED * delta
	if Input.is_action_pressed("player2_paddle_down"):
		position.y += PADDLE_SPEED * delta
	
	position.y = clamp(position.y, paddle_height/2, window_height - paddle_height/2)
