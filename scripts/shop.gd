class_name shop extends Control

@export var enabled: bool = false;
@export var player: PlayerController
@export var gm: GameManager

func _ready():
	enabled = false;
	position = Vector2(-1000, -1000);

func open():
	enabled = true;
	position = Vector2(0, -50);

func _input(event):
	if event is InputEventKey and enabled:
		if event.is_action_pressed("shop1"):
			buy(1, 50);
		elif event.is_action_pressed("shop2"):
			buy(2, 75);
		elif event.is_action_pressed("shop3"):
			buy(3, 100);
		elif event.is_action_pressed("shop4"):
			buy(4, 125);
		elif event.is_action_pressed("shop5"):
			quit();
	pass
		
		
		
func buy(item: int, amount: int):
	if item == 1:
		if player.scrapCounter.scrap >= amount:
			#+50 health
			player.health += 50;
			if player.health > player.maxHealth: player.health = player.maxHealth;
			player.healthBar.health = player.health;
			player.healthBar.setHealth();
			player.scrapCounter.scrap -= amount;
			player.scrapCounter.setScrap();
	elif item == 2:
		if player.scrapCounter.scrap >= amount:
			#+1 bounce
			player.bounces += 1;
			player.scrapCounter.scrap -= amount;
			player.scrapCounter.setScrap();
	elif item == 3:
		if player.scrapCounter.scrap >= amount:
			# 1.5x firerate
			player.weapon.fireRate /= 1.5;
			player.scrapCounter.scrap -= amount;
			player.scrapCounter.setScrap();
	elif item == 4:
		if player.scrapCounter.scrap >= amount:
			# 2x max health
			player.maxHealth *= 2;
			player.health *= 2;
			player.healthBar.health = player.health;
			player.healthBar.maxHealth = player.maxHealth;
			player.healthBar.setHealth();
			player.scrapCounter.scrap -= amount;
			player.scrapCounter.setScrap();

func quit():
	enabled = false;
	gm.paused = false;
	get_tree().paused = false
	position = Vector2(-1000, -1000);
	gm.newWave();
