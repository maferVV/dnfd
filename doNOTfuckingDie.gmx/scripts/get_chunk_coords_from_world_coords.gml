/// get_chunk_coords_from_world_coords(x, y)
// returns chunk instance id that hosts given coordinates
{
    var xx, yy, coords;
    xx = argument0;
    yy = argument1;
    coords = 0; //array
    with(objChunkManager)
    {
        coords[0] = floor(xx/chunk_width);
        coords[1] = floor(yy/chunk_height);
    }
    
    return coords;
}
