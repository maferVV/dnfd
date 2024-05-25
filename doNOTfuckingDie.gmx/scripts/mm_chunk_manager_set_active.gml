/// mm_chunk_manager_set_active(chunkx, chunky, active_set)
{
    var chunkx, chunky, active_set;
    chunkx = argument0;
    chunky = argument1;
    active_set = argument2;
    var chunk_key = mm_chunk_coords_to_key(chunkx, chunky);
    if( !ds_exists(chunks_entities, ds_type_map) )
        return 0;
    
    var chunk_entities = chunks_entities[? chunk_key];
    for(var k = ds_map_find_first(chunk_entities); !is_undefined(k); k = ds_map_find_next(chunk_entities, k))
    {
        var entity_instance = chunk_entities[? k];
        if(active_set)
            instance_activate_object(entity_instance);
        else
            instance_deactivate_object(entity_instance);
    }
    
    // mark (in)active
    ds_map_set(chunks_activated, chunk_key, active_set);
}
