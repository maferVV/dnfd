/// mm_chunk_manager_set_visible(chunkx, chunky, visible_set)
{
    var chunkx, chunky, set_visible;
    chunkx = argument0;
    chunky = argument1;
    set_visible = argument2;
    var chunk_key = mm_chunk_coords_to_key(chunkx, chunky);
    if( !ds_exists(chunks_entities, ds_type_map) )
        return 0;
    
    var chunk_entities = chunks_entities[? chunk_key];
    for (var k = ds_map_find_first(chunk_entities); !is_undefined(k); k = ds_map_find_next(chunk_entities, k))
    {
        var entity_instance = chunk_entities[? k];
        with(entity_instance)
        {
            visible = set_visible;
            if(script_exists(on_visible_script)) script_execute(on_visible_script);
        }
    }
    
    // mark (in)visible
    ds_map_set(chunks_visibility, chunk_key, set_visible);
}
