extends AnimatedSprite2D

var isLooking = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up") and !isLooking:
		self.play("up")
		isLooking = true;
		
	if Input.is_action_pressed("down") and !isLooking:
		self.play("down")
		isLooking = true;
		
	if Input.is_action_pressed("left") and !isLooking:
		self.play("left")
		isLooking = true;
		
	if Input.is_action_pressed("right") and !isLooking:
		self.play("right")
		isLooking = true;
		
	if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		isLooking = false; 
		self.play("idle")
		
	
		
