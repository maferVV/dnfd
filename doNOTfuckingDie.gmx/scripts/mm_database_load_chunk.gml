/// mm_database_load_chunk(x, y)
// Gets perlin data and makes all random() calculations for later creating build instructions.
// Returns false if it couldnt be created
var chunk, xx, yy, key;
xx = argument0; // chunk x offset
yy = argument1; // chunk y offset
key = mm_chunk_coords_to_key(string(xx), string(yy));


if( !ds_map_exists(chunks, key) )
{
    // ds_map to be filled with grids
    chunk = ds_map_create();
    rand_array_init(seed, xx, yy);
    
    seed = seed_init;
    var elevation_grid = mm_database_generate_grid_data(3,
                                                        0.666,
                                                        1.5,
                                                        1.2042,
                                                        xx,
                                                        yy);
    seed += 666+100*rand_buffer();
    var rivers_grid = mm_database_generate_grid_data(4,
                                                    0.666,
                                                    0.43,
                                                    1.2042,
                                                    xx,
                                                    yy);
    var weird_min = 1;
    var weird_max = 4;
    var weird_cells = round(rand_buffer()*(weird_max-weird_min)+weird_min);
    var weird_grid = ds_grid_create(chunk_size, chunk_size);
    for(var i = 0; i < weird_cells; i++)
    {
        var xx = floor(rand_buffer() * chunk_size);
        var yy = floor(rand_buffer() * chunk_size);
        
        weird_grid[# xx, yy] = 1;
    }
    
    // adds all grids to the map representing the chunk
    ds_map_add(chunk, "elevation_grid", elevation_grid);
    ds_map_add(chunk, "rivers_grid", rivers_grid);
    ds_map_add(chunk, "weird_grid", weird_grid);
    ds_map_add_map(chunks, key, chunk);
    return true;
}

return false;
