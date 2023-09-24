extends Node2D

# Load the camera scene
# dont need to
# var camera_scene : PackedScene =preload("res://Scenes/camera_2d.tscn")
# var camera_instance

# Load the player scene
var player_scene : PackedScene = preload("res://Scenes/Player.tscn")
var player_instance

# Load the Menu Scene
var menu_scene : PackedScene = preload("res://Scenes/Menu.tscn")
var menu_instance

#load the donkey
var donkey_scene : PackedScene = preload("res://Scenes/dungeon_donkey.tscn")
var donkey_instance

# load the first level
var levelone_scene : PackedScene = preload("res://Scenes/level_one.tscn")
var levelone_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	# Instance the player scene
	player_instance = player_scene.instantiate()
	add_child(player_instance)

	# Instance the camera
	# dont need to do this i forgot 
	# camera_instance = camera_scene.instantiate()
	# add_child(camera_instance)
	# camera_instance.position = player_instance.position
	
	# Instance menu scene hehe
	menu_instance = menu_scene.instantiate()

	# Instance new donkey mwuahahah
	donkey_instance = donkey_scene.instantiate()
	add_child(donkey_instance)
	donkey_instance.position = Vector2(450, 550)
	donkey_instance.scale = Vector2(10,10)
	
	# instance first level hehehe
	levelone_instance = levelone_scene.instantiate()
	add_child(levelone_instance)
	levelone_instance.scale = Vector2(10, 10)
	
	# Connect to our custom signals :D
	player_instance.change_hat.connect(self._on_change_hat)
	player_instance.change_cloak.connect(self._on_change_hat)

	# make the instanced scene appear in the middle of the screen, and large
	# player_instance.position = Vector2(100, 200)
	player_instance.scale = Vector2(10, 10)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_change_hat():
	player_instance.has_hat = true

func _on_change_cloak():
	player_instance.has_cloak = true
	

func _on_button_pressed():
	add_child(menu_instance)
