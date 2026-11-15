class_name Enemy extends CharacterBody2D

@export var health: int = 25;
@export var weapon: Array[Weapon];
@export var movespeed: float = 50;
@export var scrapValue: int = 25;

func _ready():
	for w in weapon:
		w.shooting = true;

func damage(amount: int):
	health -= amount;
	
func die():
	if get_tree().current_scene.find_child("Player"):
		get_tree().current_scene.find_child("Player").call("addScrap", scrapValue);
	queue_free();
