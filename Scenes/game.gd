extends Node2D

var drop_scene = preload("res://Scenes/drops-enemy.tscn")  # Adjust the path if necessary

func _ready():
	# Connect the Timer's timeout signal to call the spawn function
	$Timer.connect("timeout", Callable(self, "_on_Timer_timeout"))

func _on_Timer_timeout():
	# Create a new instance of the drop object
	var new_drop = drop_scene.instantiate()  # Use `instantiate()` in Godot 4

	# Set a random position at the top of the screen
	var screen_width = get_viewport().size.x
	new_drop.position = Vector2(randi() % int(screen_width), 0)

	# Add the new drop instance to the game scene so it appears
	add_child(new_drop)
