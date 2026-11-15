class_name Bullet extends CharacterBody2D

@export var bounces: int = 2;
@export var direction: Vector2;
@export var speed: float = 200;
@export var randomness: float = 1;
@export var sprite: AnimatedSprite2D;
@export var damage: int = 25;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = direction * speed;
	
	collide(delta);
		
	pass
	
func collide(delta: float):
	pass
	
func setBounces(amount: int):
	bounces = amount;
	
func setRandomDirection(random: float):
	direction.x += (randf() - 0.5) * random;
	direction.y += (randf() - 0.5) * random;
	
func setDirection(x: float, y: float):
	direction.x = x;
	direction.y = y;
