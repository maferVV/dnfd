/// perlin_restart()
// Clear main grid from memory and restart generation.
ds_grid_destroy(grid);
ds_map_destroy(global.tile_map);
perlin_init();
