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
    var elevation_grid = mm_database_generate_grid_data(8,
                                                        0.666,
                                                        0.47*wavelength_size,
                                                        1.2042,
                                                        xx,
                                                        yy);
    
    seed += 25165843;
    var temperature_grid = mm_database_generate_grid_data(4,
                                                            0.5,
                                                            0.3*wavelength_size,
                                                            0.7,
                                                            xx,
                                                            yy);
    
    seed += 12582917;
    var precipitation_grid = mm_database_generate_grid_data(3,
                                                            0.666,
                                                            1*wavelength_size,
                                                            1.2042,
                                                            xx,
                                                            yy);
    
    var weird_min = 5;
    var weird_max = 10;
    var weird_cells = round(rand_buffer()*(weird_max-weird_min)+weird_min);
    var weird_grid = ds_grid_create(chunk_size, chunk_size);
    for(var i = 0; i < weird_cells; i++)
    {
        var xx = floor(rand_buffer() * chunk_size);
        var yy = floor(rand_buffer() * chunk_size);
        
        weird_grid[# xx, yy] = rand_buffer();
    }
    
    
    var rand_grid = ds_grid_create(chunk_size, chunk_size);
    for(var i = 0; i < chunk_size; i++)
    {
        for(var j = 0; j < chunk_size; j++)
        {
            rand_grid[# i,j] = rand_buffer();
        } //for
    } //for
    
    // adds all grids to the map representing the chunk
    ds_map_add(chunk, "elevation_grid", elevation_grid);
    ds_map_add(chunk, "precipitation_grid", precipitation_grid);
    ds_map_add(chunk, "temperature_grid", temperature_grid);
    ds_map_add(chunk, "weird_grid", weird_grid);
    ds_map_add(chunk, "rand_grid", rand_grid);
    ds_map_add_map(chunks, key, chunk);
    return true;
}

return false;
