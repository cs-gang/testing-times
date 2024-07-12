extends PathFollow2D


var prev_position = Vector2()
@onready var teacher = $Teacher

func _physics_process(delta):
	progress += 1
	var v = global_position - prev_position
	teacher.velocity = snapped(v, Vector2(1.0, 1.0))
	prev_position = global_position
