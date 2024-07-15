extends PathFollow2D
class_name VelocityEmittingPathFollower

var prev_position = Vector2()
@onready var teacher = $Teacher
@export var speed = 65


func _physics_process(delta):
	progress += speed * delta
	var v = global_position - prev_position
	teacher.velocity = snapped(v, Vector2(1.0, 1.0))
	prev_position = global_position
