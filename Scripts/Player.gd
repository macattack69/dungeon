extends CharacterBody2D

signal change_hat
signal change_cloak

const speed = 300.0
var has_hat = false
var has_cloak = false
var hat_sprite = Sprite2D
var cloak_sprite = Sprite2D


func _ready():
	hat_sprite = $HatGreen
	cloak_sprite = $CloakGreen
	update_appearance()

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	# normalize the velocity so that the character moves at the same speed in all directions
	velocity = velocity.normalized() * speed
	move_and_slide()

func update_appearance():
	hat_sprite.visible = has_hat
	cloak_sprite.visible = has_cloak

func _on_change_hat():
	has_hat = true
	update_appearance()

func _on_change_cloak():
	has_cloak = true
	update_appearance()
