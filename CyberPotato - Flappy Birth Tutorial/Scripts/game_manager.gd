extends Node

@onready var bird: Node2D = $"../Bird" as Bird
@onready var pipe_spawner: PipeSpawner = $"../PipeSpawner" as PipeSpawner
@onready var ground: Ground = $"../Ground" as Ground
@onready var fade: Fade = $"../Fade" as Fade
@onready var ui: CanvasLayer = $"../UI" as UI

var points = 0

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	ground.bird_crashed.connect(end_fade)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)
	

func on_game_started():
	pipe_spawner.start_spawning_pipes()
	

func end_game():
	ground.stop()
	bird.kill()
	pipe_spawner.stop()
	ui.on_game_over()
	

func end_fade():
	fade.play()

func on_point_scored():
	points += 1
	ui.update_points(points)
	
