class_name Weapon extends Node2D

@export var fireRate: float = 1.0;
@export var bulletsPerShot: int = 1;
@export var bulletScene: PackedScene;
@export var bounces: int = 1;
@export var fireTimer: Timer;
@export var randomness: float = 0.5;
@export var direction: Vector2 = Vector2();

var shooting = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fireTimer.one_shot = true;
	fireTimer.wait_time = fireRate;
	fireTimer.start(fireRate + randf() + 0.5);
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if shooting: shoot();
	
func shoot() -> void:
	if fireTimer.time_left <= 0:
		fireTimer.start(fireRate);
		var bullet = bulletScene.instantiate();
		bullet.call("setBounces", bounces);
		bullet.position = global_position;
		bullet.call("setDirection", direction.x, direction.y);
		bullet.call("setRandomDirection", randomness)
		get_tree().current_scene.add_child(bullet);
	
	return;
