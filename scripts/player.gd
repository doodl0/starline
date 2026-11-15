class_name PlayerController extends CharacterBody2D

@export_group("Movement")
@export var speed = 400
@export_group("Weapon")
@export var weapon: Weapon;
@export var bounces: int = 1;
@export_group("Health")
@export var health: int = 100;
@export var maxHealth = 100;
@export var healthBar: HealthBar

@export var scrapCounter: ScrapCounter;
@export var gm: GameManager;

func _ready():
	pass
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down");
	velocity = input_direction * speed;

func _physics_process(delta):
	weapon.bounces = bounces;
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
	
	if health <= 0:
		die();
	
	healthBar.health = health;
	healthBar.setHealth();
	pass
	
func addScrap(amount: int):
	scrapCounter.scrap += amount;
	scrapCounter.setScrap();
	
func die():
	gm.paused = true;
	gm.gameOver()
