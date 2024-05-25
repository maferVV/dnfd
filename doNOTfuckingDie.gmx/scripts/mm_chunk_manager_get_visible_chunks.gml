/// mm_chunk_manager_get_visible_chunks()
{
    var t = 0;
    for( var k = ds_map_find_first(chunks_visible); !is_undefined(k); k = ds_map_find_next(chunks_visible, k) )
    {
        if( chunks_visible[? k] )
            t++;
    }
    return t;
}
