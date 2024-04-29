/// perlin_init()
/// Generates a 2D noise map and saves it in a grid.
/// Creates global vars:
///     - global.tile_map
/// Creates instance vars:
///     - seed
///     - tileSize
///     - tile_map
///     - width
///     - height
///     - grid
///     - xoffset
///     - yoffset


seed = -1;
tileSize = 0;
tile_map = noone;
width = 0;
height = 0;

// chunk coordinates [0,0], [0, -1], [0, -1], etc
xoffset = 0;
yoffset = 0;
