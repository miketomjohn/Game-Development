extends Node2D

var player_one_score : int
var player_two_score : int

func _on_ball_spawn_timer_timeout() -> void:
	$Ball.spawn_ball()
	

func _on_right_goal_body_entered(body: Node2D) -> void:
	player_one_score += 1
	$ArenaElements/ScoreBoard/PlayerOneScore.text = str(player_one_score)
	$BallSpawnTimer.start()
	


func _on_left_goal_body_entered(body: Node2D) -> void:
	player_two_score += 1
	$ArenaElements/ScoreBoard/PlayerTwoScore.text = str(player_two_score)
	$BallSpawnTimer.start()
	
