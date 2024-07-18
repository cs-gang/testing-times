extends Control

#func _ready():
	#get_tree().paused = false


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Levels/level1.tscn")


func _on_resume_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/level1.tscn")
	


#func _on_settings_button_pressed():
	#get_tree().paused = false


func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
