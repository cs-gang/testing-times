extends ShapeCast2D


@export var base = 30
@export var height = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	var points = PackedVector2Array([Vector2(0, height), Vector2(-base / 2, 0), Vector2(base / 2, 0)])
	shape.set_point_cloud(points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
