extends CharacterBody2D

const SPEED = 100

enum {
	IDLE,
	ATTACK
}

var state = IDLE
var ray2D: ShapeCast2D
@onready var target: Node2D 

func _ready():
	ray2D = $ShapeCast2D
	target = get_parent().get_child(1)

func _physics_process(_delta):
	match state:
		IDLE:
			pass
		ATTACK:
			# Calculate the direction towards the player
			var direction_to_player = (target.global_position - global_position).normalized()
			
			# Set the direction as the new velocity
			velocity = SPEED * direction_to_player
				# Use RayCast2D to check if there are obstacles in front
	if ray2D.is_colliding():
		state = ATTACK
	move_and_slide()
