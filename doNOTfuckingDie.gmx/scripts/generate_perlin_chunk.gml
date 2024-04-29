/// generate_perlin_chunk(octaves, persistence, wavelength_modifier, lacunarity, isIsland, isRefined)
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

grid = ds_grid_create(width, height);
for(var i = 0; i < width; i++){
    for(var j = 0; j < height; j++){
            if(isIsland)
            { 
                // Generate island by subtracting elliptical gradient from main noise.
                if(!refined)
                { 
                
                    // If autotiling isn't needed, continue normally.
                    var zz = clamp((get_perlin(i + (xoffset*width), j + (yoffset*height), octaves, persistence, wavelength_modifier, lacunarity) - elliptical_gradient(i, j)),0,1);
                    grid[# i,j] = zz;
                    /*
                    Due to nature of the elliptical gradient equation, it could be something like: 
                    0.5 - 0.7 = -0.2, 
                    so clamp the output within your range.
                    */
                    
                }
                else
                { 
                
                    // Else send grid values to "refining" script.
                    var zz = clamp((get_perlin(i + (xoffset*width), j + (yoffset*height), octaves, persistence, wavelength_modifier, lacunarity) - elliptical_gradient(i, j)),0,1);
                    grid[# i,j] = refine_grid_at(zz);
                
                }
                
            }
            else
            { 
                // Generate full room landmass.
                if(!refined)
                { 
                    // If autotiling isn't needed, continue normally.
                    var zz = get_perlin(i + (xoffset*width), j + (yoffset*height), octaves, persistence, wavelength_modifier, lacunarity);
                    grid[# i,j] = zz;
                    
                }
                else
                { 
                    // Else send grid values to "refining" script.
                    var zz = get_perlin(i + (xoffset*width), j + (yoffset*height), octaves, persistence, wavelength_modifier, lacunarity);
                    grid[# i,j] = refine_grid_at(zz);
               
               }
            }
    
    } //for
} //for
