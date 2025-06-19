extends Sprite2D

# Sets a "selected" bool to be false. The bool is used to check if the node is currently being dragged.
var selected: bool = false

# Sets the original position to be the same as the global position, such that the node can return to whence it came when it's dropped.
var originalPosition = global_position

# Creates the drop signal with the event parameter, so the information can be signaled to another script.
signal drop(event)

# This function triggers whenever there is an input event happending, and then checks if the event is either the left mouse button pressed or released events. If the first, then it sets selected to be true, and if the second, it sends the drop signal and sets selected to be false.
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			selected = true
		elif selected:
			drop.emit(event)
			selected = false

# This loop checks if selected is true, or if the node's position isn't the same as its original position. If the first, then it will smoothly make the node follow the mouse pointer, and if the second, it will smoothly make the node return to its original position.
func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 20*delta)
	elif global_position != originalPosition:
		global_position = lerp(global_position, originalPosition, 20*delta)
