extends TileMapLayer

class_name MaskedTileMapLayer

var active_mask: Mask
var allowed_masks: Array[Mask]

func _ready() -> void:
	position = get_viewport_rect().size / 2
	scale = scale * 4
	
func switch_mask(mask: Mask) -> void:
	active_mask = mask
	active_mask.connect("mask_rotated", set_new_masked_tiles)

func set_new_masked_tiles() -> void:
	for y in range(-10, 11):
		for x in range(-10, 11):
			var level_coords = Vector2i(x, y)
			var world_coords = self.to_global(self.map_to_local(level_coords))
			var mask_coords = active_mask.local_to_map(active_mask.to_local(world_coords))
			
			var mask_tile_data = active_mask.get_cell_tile_data(mask_coords)
			var level_tile_data = self.get_cell_tile_data(level_coords)

			if not level_tile_data:
				continue
			
			var atlas_coords = self.get_cell_atlas_coords(level_coords)

			if not mask_tile_data:
				if level_tile_data:
					atlas_coords.y = 0
					self.set_cell(level_coords, 0, atlas_coords)
			else:
				atlas_coords.y = 1
				self.set_cell(level_coords, 0, atlas_coords)
				
	
