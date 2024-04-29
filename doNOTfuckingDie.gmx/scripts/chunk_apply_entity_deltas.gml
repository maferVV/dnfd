/// chunk_apply_entity_deltas
{
    // The only relevant delta rn is removal of entity ids,
    // so just loop through the destroyed list and remove 
    // any id present in the metadata_map
    var coords = get_chunk_coords_from_world_coords(x, y);
    var key = chunk_coords_to_key(coords[0], coords[1]);
    var removed_entity_ids_list = ds_map_find_value(myManager.chunks_destroyed_entity_ids, key);
    if( !is_undefined(removed_entity_ids_list) && ds_exists(removed_entity_ids_list, ds_type_list) )
    {
        for(var i = 0; i < ds_list_size(removed_entity_ids_list); i++)
        {
            var entityid = ds_list_find_value(removed_entity_ids_list, i);
            var map_to_destroy = ds_map_find_value(entity_metadata, entityid);
            if( ds_exists(map_to_destroy, ds_type_map) )
            {
                ds_map_destroy(map_to_destroy);
                ds_map_delete(entity_metadata, entityid);
            }
        }
    }
}
