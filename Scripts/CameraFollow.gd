extends Camera2D

@onready var target: Node2D 
# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_parent().get_child(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = target.position
