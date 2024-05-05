extends Camera2D
@export var target_area: Vector2 = Vector2(4608,2624)
var dimensions

func set_camera(size: Vector2):
	var camera_size = get_viewport().size
	var width_ratio = size.x / camera_size.x
	var height_ratio = size.y / camera_size.y
	var max_ratio = max(width_ratio, height_ratio)
	dimensions = Vector2(size.x / max_ratio, size.y / max_ratio)
	self.zoom = Vector2(dimensions.x/size.x, dimensions.y/size.y)

func _process(_delta):
	set_camera(target_area)
	var viewportSize := Vector2(get_viewport().size)
	$waterShader.scale = (viewportSize / $waterShader.texture.get_size()) / zoom
	$waterShader.global_rotation = 0
