/// item_generate_at(xx, yy, item_name)
{
    var xx, yy, item_name;
    xx = argument0;;
    yy = argument1;
    item_name = argument2;
    
    // Get room chunk for room [x,y]
    var db = interface_item_find_db();
    var chunk_size_pixels = db.chunk_size * db.tile_size_pixels;
    var chunk_x = floor(xx/chunk_size_pixels);
    var chunk_y = floor(yy/chunk_size_pixels);
    var chunk_key = mm_chunk_coords_to_key(chunk_x, chunk_y);
    
    // Create blueprint first with the info we need
    var blueprints = db.blueprints;
    var chunk_blueprints = blueprints[? chunk_key];
    var entity_index = ds_map_size(chunk_blueprints)-1;
    do
    {
        entity_index++;
    }
    until( !ds_map_exists(chunk_blueprints, entity_index) )
    with(db)
    {
        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "obj", objOverworldItem);
        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "x", xx);
        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "y", yy);
        mm_chunk_log_entity_metadata(chunk_blueprints, entity_index, "item_name", item_name);
    }
    
    // Then instantiate blueprint
    var instantiator = db.instantiator;
    var instance = noone;
    with(instantiator)
    {
        var chunk_entities = chunks_entities[? chunk_key];
        var entity_blueprints = chunk_blueprints[? entity_index];
        instance = mm_instantiator_instantiate_entity(chunk_entities,
                                                            entity_blueprints,
                                                            entity_index,
                                                            chunk_x,
                                                            chunk_y,
                                                            true,
                                                            true);
    }
    return instance;
}
