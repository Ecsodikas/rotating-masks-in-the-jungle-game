extends Node2D

var rotating = false

func _ready() -> void:
	pass
	
func _input(event):
	if event.is_action_pressed("rotate_mask_right"):
		rotate_mask(false)
	if event.is_action_pressed("rotate_mask_left"):
		rotate_mask(true)


func rotate_mask(left: bool) -> void:
	var tween = $TileMapLayer.create_tween()
	if left and not rotating:
		rotating = true
		tween.tween_property($TileMapLayer, "rotation_degrees", $TileMapLayer.rotation_degrees - 90, 0.2)
	elif not rotating:
		rotating = true
		tween.tween_property($TileMapLayer, "rotation_degrees", $TileMapLayer.rotation_degrees + 90, 0.2)
		
	await tween.finished
	rotating = false
