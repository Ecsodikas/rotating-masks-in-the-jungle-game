extends Node

var masks: Array[Mask]
var levels: Array[MaskedTileMapLayer]

func _ready() -> void:
	masks = [
		preload("res://assets/masks/mask_1.tscn").instantiate()
	]
	levels = [
		preload("res://assets/levels/demo.tscn").instantiate()
	]

func load_level(level: int) -> void:
	var game_scene = get_tree().get_nodes_in_group("game_scene")[0]
	var current_level: MaskedTileMapLayer = levels[level]
	current_level.allowed_masks = masks
	current_level.active_mask = masks[0]
	current_level.switch_mask(current_level.active_mask)
	
	game_scene.add_child(current_level)
	game_scene.add_child(current_level.active_mask)

	
	
