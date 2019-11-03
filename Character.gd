extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed = 4
var jump_speed = 6

var velocity = Vector3()

func _physics_process(delta: float) -> void:
	velocity += gravity* delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	
func get_input():
	velocity.x = 0
	velocity.z = 0
	
	if Input.is_action_pressed("move_forward"):
		velocity.z -= speed
		print("W press")
	if Input.is_action_pressed("move_back"):
		velocity.z += speed
		print("S press")
	if Input.is_action_pressed("strafe_left"):
		velocity.x -= speed
	if Input.is_action_pressed("strafe_right"):
		velocity.x += speed
	