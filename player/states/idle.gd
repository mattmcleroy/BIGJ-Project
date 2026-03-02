extends PlayerState

func enter() -> void:
	print(IDLE)
	# set animation to idle
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	var x_input = Input.get_axis("move_left", "move_right")
	
	if !player.is_on_floor():
		finished.emit(FALLING)
		return
	
	if x_input != 0:
		finished.emit(RUNNING)
		return
		
	if Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
		return
		
	player.apply_gravity(_delta)
	player.move_and_slide()
 
func exit() -> void:
	pass
