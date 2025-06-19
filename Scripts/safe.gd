extends Sprite2D

func _on_file_drop(event: Variant) -> void:
	if get_rect().has_point(to_local(event.position)):
		print("Safe")
