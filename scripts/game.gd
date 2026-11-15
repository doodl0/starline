class_name GameManager extends Node2D

@export var paused: bool = false;

@export var enemyWaves: Array[PackedScene];
@export var waveTimer: Timer;
@export var enemyHealthBar: HealthBar;
@export var gameOverScreen: PackedScene;
@export var shop: shop;
var difficulty = 1;

var currentWave: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var wave = enemyWaves[currentWave].instantiate();
	wave.call("setGM", self);
	wave.call("setHealthBar", enemyHealthBar);
	get_tree().current_scene.add_child(wave);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;

func _physics_process(delta: float) -> void:
	get_tree().paused = paused;
	
func gameOver():
	var go = gameOverScreen.instantiate();
	get_tree().current_scene.add_child(go);
	pass;

func roundFinished():
	currentWave += 1
	difficulty = currentWave / 3 + 1;
	shop.open();
	paused = true;
	pass;

func newWave():
	if currentWave >= enemyWaves.size(): currentWave = 0;
	var wave = enemyWaves[currentWave].instantiate();
	wave.call("setDifficulty", difficulty);
	wave.call("setHealthBar", enemyHealthBar);
	wave.call("setGM", self);
	get_tree().current_scene.add_child(wave);
