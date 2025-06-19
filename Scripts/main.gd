extends Node2D

func timerLabelUpdate(time):
	var minutes = str(int(time/60))
	var seconds = str(int(fmod(time, 60)))
	if minutes.length() == 1:
		minutes = "0" + minutes
	if seconds.length() == 1:
		seconds = "0" + seconds
	$MarginContainer/HBoxContainer/TimerPanel/TimerLabel.text = "%s:%s" % [minutes, seconds]
	
func _ready():
	$Timer.start()
	
func _process(delta):
	var time = $Timer.time_left
	timerLabelUpdate(time)
