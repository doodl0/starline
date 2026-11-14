extends CharacterBody2D

@export var bounces: int = 2;
@export var direction: Vector2;
@export var speed: float = 200;
@export var randomness: float = 1;
@export var sprite: AnimatedSprite2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every physics tick. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = direction * speed;
	
	bounce(delta);
		
	pass
	
	
func bounce(delta: float):
	var collision_info = move_and_collide(velocity * delta);
	if collision_info:
		bounces -= 1;
		sprite.frame = 3 - bounces;
		if bounces == 0: queue_free();
		direction = velocity.bounce(collision_info.get_normal()).normalized();
		direction.x += (randf() - 0.5) * randomness;
		direction.y += (randf() - 0.5) * randomness;
		direction = direction.normalized();
	pass
