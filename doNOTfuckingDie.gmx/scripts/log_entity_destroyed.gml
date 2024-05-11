/// log_entity_destroyed(chunk_x, chunk_y, entityId)
// Sets a log for destroyed id, whatever maps stores this needs to be 
// in objChunkManager to keep memory of it once chunk gets destroyed.
/*
{
    var chunk_x, chunk_y, entityId;
    chunk_x = argument0;
    chunk_y = argument1;
    entityId = argument2;
    with(objChunkManager)
    {
        var key = chunk_coords_to_key(chunk_x, chunk_y);
        var list = ds_map_find_value(chunks_destroyed_entity_ids, key);
        if( is_undefined(list) )
        {
            list = ds_list_create();
            ds_map_add_list(chunks_destroyed_entity_ids, key, list);
        }
        
        ds_list_add(list, entityId);
        
        print("Destroyed entities in chunk "+key+": "+ds_list_to_string(list));
    }
}
