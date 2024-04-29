/// generate_trawl_chunk(octaves, persistence, wavelength_modifier, lacunarity, isIsland, isRefined)
///
/// Uses the following instance vars:
///     - seed
///     - tileSize
///     - tile_map
///     - width
///     - height
///     - grid
///     - xoffset
///     - yoffset
/// 
///         Octaves - How many layers of noise will be summarised for the final output. More octave, more errosion.
///         Persistence - How fast amplitude of each new octave will diminish. Higher values = more random generation.
///         Lacunarity - How much frequency of each new octave will increase. Lower values = smoother islands \ terrain.
///         Is island - If TRUE, elliptical gradient is applied and an island will be generated.
///                     If FALSE, full room terrain will be generated.
///
///         Wavelength Modifier is basically a Chunk Size.
///         The resulting grid will be obviously the same size, but a larger number
///         will "zoom out" the resulting picture.
///             At 1 the chunk for generation will be = grid width / 1.
///             2 = grid width / 2. Etc.
///             2 - 4 is optimal for good looking islands. 
///             But if you want more eroded islands or more smaller details for full room terrain, you can try higher numbers.

var octaves = argument0;
var persistence = argument1;
var wavelength_modifier = argument2;
var lacunarity = argument3;
var isIsland = argument4;
var refined = argument5;
var grid = ds_grid_create(width, height);

for(var i = 0; i < width; i++){
    for(var j = 0; j < height; j++){
            
            // ignore isIsland and isRefined vars
            
            var zz = get_perlin(i + (xoffset*width), j + (yoffset*height), octaves, persistence, wavelength_modifier, lacunarity, grid);
            grid[# i,j] = zz;
    
    } //for
} //for

return grid;