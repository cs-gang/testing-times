extends Node2D

var prog_bar_value = 0

func _ready():
	$ProgBar.value = 0 
	Engine.max_fps = 60

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		prog_bar_value += 1
		if prog_bar_value%60 == 0:
			$ProgBar.value +=5
	else:
		prog_bar_value = 0



