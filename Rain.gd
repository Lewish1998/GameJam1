extends ParallaxBackground

var scrolling_speed = 200
var scrolling_speedx = 20

func _process(delta):
	scroll_offset.y += scrolling_speed * delta
	scroll_offset.x += scrolling_speedx * delta
