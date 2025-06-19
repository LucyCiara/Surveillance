extends Sprite2D


var selected: bool = false
var originalPosition = global_position
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				selected = true
		elif selected:
			selected = false

func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 20*delta)
	elif not selected and global_position != originalPosition:
		global_position = lerp(global_position, originalPosition, 20*delta)
