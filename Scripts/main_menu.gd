extends Control


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level1.tscn")

#func _on_settings_button_pressed():

func _on_exit_button_pressed():
	get_tree().quit()
