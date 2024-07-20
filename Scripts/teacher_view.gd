extends ShapeCast2D


@export var base = 30
@export var height = 40

var count = 0; 
@onready var cooldown = get_node("Cooldown")
@export var cooldownDuration = 3

@onready var lives = $"../../../../CanvasLayer/Control"

# Called when the node enters the scene tree for the first time.
func _ready():
	var points = PackedVector2Array([Vector2(0, height), Vector2(-base / 2, 0), Vector2(base / 2, 0)])
	shape.set_point_cloud(points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Triangle.visible = enabled
	if self.is_colliding(): 
		if cooldown.is_stopped():
			if self.get_collider(0).get_parent().isCheating:
				lives.get_children()[count].play("on")
				count+=1
				if count == 3: 
					get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
				cooldown.start(cooldownDuration)
				
	
