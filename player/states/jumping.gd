extends PlayerState

var time_jumping := 0.0
const hang_time = 0.2
const up_time = 0.15

func enter(previous_state_path: String, payload := {}) -> void:
	print(JUMPING)
	time_jumping = 0.0
	player.velocity.y = player.JUMP_VELOCITY
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	#player.apply_gravity(_delta)
	player.move_in_air(_delta)
	
	if not Input.is_action_pressed("jump"):
		finished.emit(FALLING)
		player.move_and_slide()
		return;
	
	if player.is_on_ceiling():
		player.velocity.y = 0
		finished.emit(FALLING)
		player.move_and_slide()
		return
	
	if time_jumping > up_time:
		player.apply_gravity(_delta)
	
	if player.velocity.y >= 0:
		player.velocity.y = 0
		
	if time_jumping > up_time + hang_time:
		finished.emit(FALLING)
		player.move_and_slide()
		return		
	if player.velocity.y > 0 and player.is_on_floor():
		finished.emit(IDLE)
		
	if player.velocity.y > 0:
		finished.emit(FALLING)
	
	player.move_and_slide()
	time_jumping += _delta

func exit() -> void:
	pass
