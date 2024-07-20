extends AnimatedSprite2D

var isLooking = false;

@export var isCheating = false;

@onready
var camera = get_node("%Camera2D");

@onready
var audioStreamPlayer = get_node("AudioStreamPlayer2D");

@export
var cameraSpeed = 100;
@export
var originalCamX = 0;
@export
var originalCamY = 0;
@export
var limitCamXPos = 0;
@export
var limitCamXNeg = 0;
@export
var limitCamYPos = 0;
@export
var limitCamYNeg = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up") and !isLooking:
		isLooking = true;
		
	if Input.is_action_pressed("up"):
		if (camera.position.y > limitCamYNeg):
			camera.position.y -= cameraSpeed * delta;
		
	if Input.is_action_pressed("down") and !isLooking:
		self.play("down")
		isLooking = true;
		
	if Input.is_action_pressed("down"):
		if (camera.position.y < limitCamYPos):
			camera.position.y += cameraSpeed * delta;
		
	if Input.is_action_pressed("left") and !isLooking:
		self.play("left")
		isLooking = true;
		
	if Input.is_action_pressed("left"):
		if (camera.position.x > limitCamXNeg):
			camera.position.x -= cameraSpeed * delta;
		
	if Input.is_action_pressed("right") and !isLooking:
		self.play("right")
		isLooking = true;
		
	if Input.is_action_pressed("right"):
		if (camera.position.x < limitCamXPos):
			camera.position.x += cameraSpeed * delta;
		
	if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		isLooking = false; 
		self.play("idle")
		
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		get_tree().change_scene_to_file("res://Scenes/pause_menu.tscn")
		
	if Input.is_action_pressed("cheat"):
		self.play("cheat")
		isCheating = true;
		
	if Input.is_action_just_pressed("cheat"):
		audioStreamPlayer.play();
	
	if Input.is_action_just_released("cheat"):
		isCheating = false;
		audioStreamPlayer.stop();
		self.play("idle")
		
	if !isLooking:
		if camera.position.y > originalCamY: 
			camera.position.y -= cameraSpeed * delta;
		if camera.position.y < originalCamY: 
			camera.position.y += cameraSpeed * delta;
		if camera.position.x > originalCamX: 
			camera.position.x -= cameraSpeed * delta;
		if camera.position.x < originalCamX: 
			camera.position.x += cameraSpeed * delta;
