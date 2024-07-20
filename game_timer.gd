extends Control

@onready var timer = get_node("Timer")
@onready var label = get_node("Label") 

@export var duration = 120;
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "%02d:%02d" % time_left()
	
func time_left():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
