extends Spatial

func _process(delta: float) -> void:
	$CameraHub.rotate_y(0.01)