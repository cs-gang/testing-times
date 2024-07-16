extends AnimatedSprite2D

var directions = ["down", "left", "right"];

@onready
var timer = get_node("Timer");

@export
var intervals = [6,14,20];

var cooldown = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	var wait_time = intervals[randi() % intervals.size()];
	setTimer(wait_time);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setTimer(seconds):
	timer.wait_time = seconds;
	timer.one_shot = true;
	timer.start();

func _on_timer_timeout():
	if !cooldown:
		var dir = directions[randi() % directions.size()];
		if dir=="down":
			self.play("down")
		if dir=="left":
			self.play("left");
		if dir=="right":
			self.play("right");
		cooldown = true;
		setTimer(1);
	else: 
		cooldown = false;
		self.play("default");
		var wait_time = intervals[randi() % intervals.size()]
		setTimer(wait_time);
	
