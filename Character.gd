extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed = 4
var jump_speed = 6
var spin = 0.1
var velocity = Vector3()

func _physics_process(delta: float) -> void:
	velocity += gravity* delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	
func get_input():
	var vely = velocity.y
	velocity = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		#velocity.z -= speed
		velocity += -transform.basis.z * speed
		
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
		
	if Input.is_action_pressed("strafe_left"):
		#velocity.x -= speed
		velocity += -transform.basis.x * speed
		
	if Input.is_action_pressed("strafe_right"):
		#velocity.x += speed
		velocity += transform.basis.x * speed
	velocity.y = vely
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0,spin, event.relative.x/10))