/// mm_database_get_chunk_blueprints(key)
// Gets the map representing the chunk with its blueprints.
// If it doesnt exist, creates it.
{
    var key = argument0;
    var chunk_blueprints = blueprints[? key];
    if( is_undefined(chunk_blueprints) )
    {
        chunk_blueprints = ds_map_create();
        ds_map_add_map(blueprints, key, chunk_blueprints);
    }
    return chunk_blueprints;
}
