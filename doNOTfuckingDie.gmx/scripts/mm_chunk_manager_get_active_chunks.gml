/// mm_chunk_manager_get_active_chunks()
{
    var t = 0;
    for( var k = ds_map_find_first(chunks_activated); !is_undefined(k); k = ds_map_find_next(chunks_activated, k) )
    {
        if( chunks_activated[? k] )
            t++;
    }
    return t;
}
