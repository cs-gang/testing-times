extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var height = $"..".height
	var base = $"..".base
	polygon = PackedVector2Array([Vector2(0, height), Vector2(base / 2, 0), Vector2(- base / 2, 0)])
	position.y = height


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
