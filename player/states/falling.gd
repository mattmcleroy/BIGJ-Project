extends PlayerState


func enter() -> void:
	print(FALLING)
	# set animation to falling
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	player.apply_gravity(_delta)
	
	if player.velocity.y > 0 and player.is_on_floor():
		finished.emit(IDLE)
	
	player.move_and_slide()

func exit() -> void:
	pass
