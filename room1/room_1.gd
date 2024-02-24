extends Node2D

var rng = RandomNumberGenerator.new()
var flicker = 3

func _process(delta):
	var my_random_number = rng.randf_range(0.0, 1.7)	
	$PointLight2D.energy = lerp($PointLight2D.energy, my_random_number, flicker*delta)
