extends Node2D

# A function to update the label to reflect the timer's remaining time in a formatted way.
func timerLabelUpdate(time):
	var minutes = str(int(time/60))
	var seconds = str(int(fmod(time, 60)))
	if minutes.length() == 1:
		minutes = "0" + minutes
	if seconds.length() == 1:
		seconds = "0" + seconds
	$MarginContainer/HBoxContainer/TimerPanel/TimerLabel.text = "%s:%s" % [minutes, seconds]

# Starts the timer
func _ready():
	$Timer.start()

# This loop checks the remaining time on the timer and runs the timerLabelUpdate function with it as a parameter to reflect the remaining time.
func _process(delta):
	var time = $Timer.time_left
	timerLabelUpdate(time)
