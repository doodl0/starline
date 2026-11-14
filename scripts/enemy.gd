class_name Enemy extends CharacterBody2D

@export var health: int = 25;
@export var weapon: Weapon;
@export var movespeed: float = 50;

func _ready():
	weapon.shooting = true;

func damage(amount: int):
	health -= amount;
	if health <= 0:
		queue_free();
