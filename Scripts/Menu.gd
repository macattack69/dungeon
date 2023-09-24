extends Control

# Load the player scene
var player_scene : PackedScene = preload("res://Scenes/Player.tscn")
var player_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	# Instance the player scene
	player_instance = player_scene.instantiate()
	add_child(player_instance)

	# Connect to our custom signals :D
	player_instance.change_hat.connect(self._on_change_hat)
	player_instance.change_cloak.connect(self._on_change_hat)

	# make the instanced scene appear in the middle of the screen, and large
	player_instance.position = Vector2(100, 200)
	player_instance.scale = Vector2(10, 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_change_hat():
	player_instance.has_hat = true

func _on_change_cloak():
	player_instance.has_cloak = true

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_hat_pressed():
	player_instance.emit_signal("change_hat")

func _on_cloak_pressed():
	player_instance.emit_signal("change_cloak")
