extends PathFollow2D

## Whether the teachers wait time once stopped should be random
@export var random_wait: bool = false
## Amount of time the teacher waits once stopped; only used if random_wait is false
@export var wait_time: float = 1.0
## Whether the teachers movement speed should be random
@export var random_speed: bool = false
## The teachers movement speed; only used if random_speed is false
@export var speed: int = 65
## Used to decide the size of the interval from which the next target position
## is randomly chosen (bigger value will lead to possibly longer distances
## covered in between stops).
@export var random_interval_size: float = 0.2

@onready var teacher = $Teacher
var prev_position = Vector2()
var rng = RandomNumberGenerator.new()
var target_ratio: float
var waiting: bool = false


func _ready():
	if random_speed:
		speed = rng.randi_range(45, 85)
	target_ratio = next_target(target_ratio, random_interval_size)
	print("Target ratio set: " + str(target_ratio))


func next_target(current: float, interval: float) -> float:
	var low = 0.0
	var high = 1.0
	if current > interval:
		low = current - interval
	if (current + interval) < 1.0:
		high = current + interval
	return rng.randf_range(low, high)


func _physics_process(delta):
	var dir = 1
	# Both target and progress_ratio are floats and they will never end up
	# EXACTLY the same; so once they're close enough we decide that we've
	# reached the target, and pick a new target
	if absf(target_ratio - progress_ratio) < 0.01:
		if waiting:
			teacher.velocity = Vector2(0.0, 0.0)
			return
		else:
			waiting = true
			await get_tree().create_timer(
				rng.randf_range(0.3, 0.6) if random_wait else wait_time,
				false,
				true
			).timeout
			waiting = false
			target_ratio = next_target(target_ratio, random_interval_size)
			return
	
	if target_ratio < progress_ratio:
		dir = -1
	
	progress += dir * speed * delta
	var v = global_position - prev_position
	teacher.velocity = snapped(v, Vector2(1.0, 1.0))
	prev_position = global_position
	
