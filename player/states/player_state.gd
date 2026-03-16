class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"
const WALL_SLIDING = "WallSliding"
const POUNCING = "Pouncing"
const WALL_JUMPING = "WallJumping"

var player: Player
var animator: PlayerAnimator

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
	
	animator = get_node("../../AnimatedSprite2D")
	
	if animator != null:
		print("Found Animator")
