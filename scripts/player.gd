extends CharacterBody2D

@export_group("Movement")
@export var speed = 400
@export_group("Weapon")
@export var weapon: Weapon;
@export_group("Health")
@export var health: int = 100;

func _ready():
	pass
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down");
	velocity = input_direction * speed;

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("shoot"):
			weapon.shooting = true;
		elif event.is_action_released("shoot"):
			weapon.shooting = false;

func damage(amount: int):
	health -= amount;
	pass
