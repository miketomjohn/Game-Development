extends CanvasLayer

class_name UI

@onready var lives_label: Label = %LivesLabel
@onready var game_lost_container: CenterContainer = $GameLostContainer
@onready var level_won_container: CenterContainer = $LevelWonContainer

func set_lives(lives: int):
	lives_label.text = "Lives: %d" % lives
	

func game_over():
	game_lost_container.show()
	

func _on_game_lost_button_pressed() -> void:
	get_tree().reload_current_scene()
	

func on_level_won():
	level_won_container.show()

func _on_level_won_button_pressed() -> void:
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
	
