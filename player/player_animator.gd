class_name PlayerAnimator extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func walk_left() -> void:
	animation = "walk_left"

func walk_right() -> void:
	animation = "walk_right"
