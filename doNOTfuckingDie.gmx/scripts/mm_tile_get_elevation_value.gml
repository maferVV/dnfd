/// mm_tile_get_elevation_value(tile_x_total, tile_y_total)
// From the given values, we haver to find the correct chunk and place
// in the elevation grid, then return that number
{
    var tile_x_total, tile_y_total;
    tile_x_total = argument0;
    tile_y_total = argument1;
    
    var chunkx = floor(tile_x_total / chunk_size);
    var x_in_chunk = tile_x_total mod chunk_size;
    
    var chunky = floor(tile_y_total / chunk_size);
    var y_in_chunk = tile_y_total mod chunk_size;
    
    print_vars("chunkx", chunkx, "chunky", chunky, "x_in_chunk", x_in_chunk, "y_in_chunk", y_in_chunk);
    var key = mm_chunk_coords_to_key(chunkx, chunky);
    var chunk = chunks[? key];
    if(is_undefined(chunk)) return 2;
    var elevation_grid = chunk[? "elevation_grid"];
    if(is_undefined(elevation_grid)) return 3;
    var pre_elevation = elevation_grid[# x_in_chunk, y_in_chunk];
    if(is_undefined(pre_elevation)) return 4;
    var elevation = abs(map_value(pre_elevation,0,1,-1,1));
    
    return elevation;
}
