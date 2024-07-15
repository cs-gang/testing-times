extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if velocity.y > 0:
		$AnimatedSprite2D.play("walk_front")
		$TeacherView.enabled = true
	elif velocity.y < 0:
		$AnimatedSprite2D.play("walk_back")
		$TeacherView.enabled = false

	
	if velocity.x < 0:
		$AnimatedSprite2D.play("turn")
		$AnimatedSprite2D.flip_h = false
		$TeacherView.enabled = false
	elif velocity.x > 0:
		$AnimatedSprite2D.play("turn")
		$AnimatedSprite2D.flip_h = true
		$TeacherView.enabled = false
	
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite2D.play("idle")
		$TeacherView.enabled = true
