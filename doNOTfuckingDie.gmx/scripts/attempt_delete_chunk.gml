/// attempt_add_chunk(chunk_x, chunk_y)
// uses instance map chunks
{
    var chunk_x, chunk_y;
    chunk_x = argument0;
    chunk_y = argument1;
    
    var key = chunk_coords_to_key(chunk_x, chunk_y);
    if( ds_map_exists(chunks, key) )
    {
        instance_destroy( ds_map_find_value(chunks, key) );
        ds_map_delete(chunks, key);
    }
}
