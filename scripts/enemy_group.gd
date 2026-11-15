class_name EnemyGroup extends Path2D

@export var maxTotalHealth: int = 125;
@export var pathFollow: PathFollow2D
@export var enemies: Array[Enemy]
@export var enemyTotal: int = 5
@export var speed: float = 100
@export var startPos: Vector2 = Vector2(0, -80);
@export var healthBar: HealthBar;
@export var timer: Timer;
@export var difficulty: int = 1;
var gm: GameManager;
var progress: float = 0;
var finished: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (healthBar.label2 != null):
		healthBar.label2.text = "Wave Health:\n Difficulty " + str(difficulty);
	speed *= difficulty;
	healthBar.maxHealth = maxTotalHealth * difficulty;
	position = startPos;
	for e in enemies:
		e.health *= difficulty
		for w in e.weapon:
			w.fireRate /= float(difficulty)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (healthBar.label2 != null):
		healthBar.label2.text = "Wave Health:\n Difficulty " + str(difficulty);
	if finished:
		position.y -= speed / 100
	elif totalHealth() <= 0:
		finished = true;
		_on_timer_timeout();
	for i in range(0, enemies.size()):
		if enemies[i] == null: pass
		elif enemies[i].health <= 0: 
			enemies[i].die();
			enemyTotal -= 1;
			enemies[i] = null;
		else:
			progress += speed / 25000.0 / (float(enemyTotal));
			pathFollow.progress_ratio = progress + (i * 1.0/enemies.size());
			enemies[i].position = pathFollow.position;
	
	healthBar.health = totalHealth();
	healthBar.maxHealth = maxTotalHealth * difficulty;
	healthBar.setHealth()
	pass

func _on_timer_timeout() -> void:
	if finished:
		gm.roundFinished();
		queue_free();
	finished = true;
	timer.wait_time = 2;
	pass # Replace with function body.
	
func totalHealth() -> int:
	var h: int = 0;
	for e in enemies:
		if e != null:
			h += e.health;
	return h;
	
func setHealthBar(bar: HealthBar):
	healthBar = bar;
	
func setGM(g: GameManager):
	gm = g;
	
func setDifficulty(amount: int):
	difficulty = amount;
