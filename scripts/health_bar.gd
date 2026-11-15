class_name HealthBar extends Control

@export var maxHealth = 100;
@export var health = 100;

@export var frames = 51
@export var sprite: AnimatedSprite2D

@export var label: Label
@export var label2: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(health);
	sprite.frame = health / (maxHealth / (frames - 1));
	pass # Replace with function body.

func setHealth():
	label.text = str(health);
	sprite.frame = health / (maxHealth / (frames - 1));
