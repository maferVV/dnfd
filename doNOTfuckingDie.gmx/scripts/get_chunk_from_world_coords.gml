/// get_chunk_from_world_coords(x, y)
// returns chunk instance id that hosts given coordinates
{
    var xx, yy;
    xx = argument0;
    yy = argument1;
    
    with(objChunkManager)
    {
        var chunk_x = floor(xx/chunk_width);
        var chunk_y = floor(yy/chunk_height);
        var key = string(chunk_x)+","+string(chunk_y);
        if( ds_map_exists(chunks, key) )
        {
            return ds_map_find_value(chunks, key);
        }
    }
    
    return undefined;
}
