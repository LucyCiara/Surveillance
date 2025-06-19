extends Sprite2D

# When it recieves the custom file signal that the file is dropped, it will check if the Unsafe node's rectangle contains the event position, in which case it'll print.
func _on_file_drop(event: Variant) -> void:
	if get_rect().has_point(to_local(event.position)):
		print("Unsafe")
