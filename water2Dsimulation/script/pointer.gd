extends RigidBody2D

var captured: bool = true

func _ready() -> void:
	position = get_global_mouse_position()

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $Timer.time_left == 0:
		captured = not captured
		$Timer.start()
	if captured:
		var I = 500*mass#infuence
		var S = 20#stiffness 
		var P = get_global_mouse_position() - global_transform.origin
		var M = mass
		var V = linear_velocity
		var impulse = (I*P) - (S*M*V)
		apply_central_impulse(impulse * delta)
