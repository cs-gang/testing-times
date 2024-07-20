extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !$'/root/Bgm'.is_playing():
		self.set_pressed(true)

func _on_toggled(toggled_on):
	if toggled_on:
		$'/root/Bgm'.stop()
	else:
		$'/root/Bgm'.play()
