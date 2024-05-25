/// mm_instantiator_instantiate_chunk(_chunk_x, _chunk_y, [visible = false], [activated = false])
// Instantiates chunks based on blueprints
{
    var _chunk_x = argument[0];
    var _chunk_y = argument[1];
    var is_visible = false; if(argument_count > 2) is_visible = argument[2];
    var activated = false; if(argument_count > 3) activated = argument[3];
    if(instance_exists(db))
    {
        // get blueprints for this chunk
        var blueprints = db.blueprints;
        var chunk_key = mm_chunk_coords_to_key(_chunk_x, _chunk_y);
        var chunk_blueprints = blueprints[? chunk_key];
        // create map for this chunk
        var chunk_entities = ds_map_create();
        ds_map_add_map(chunks_entities, chunk_key, chunk_entities);
        // iterate through each entity
        for(var k = ds_map_find_first(chunk_blueprints); !is_undefined(k); k = ds_map_find_next(chunk_blueprints, k))
        {
            var entity_blueprints = chunk_blueprints[? k];
            // required vars for intatiation
            var obj = entity_blueprints[? "obj"];
            var xx = entity_blueprints[? "x"];
            var yy = entity_blueprints[? "y"];
            var entity_instance = instance_create(xx, yy, obj);
            with(entity_instance)
            {
                mm_entity_create();
                instantiator = other.id;
                index = k;
                chunk_x = _chunk_x;
                chunk_y = _chunk_y;
                mm_entity_apply_blueprint(entity_blueprints);
                // Starting conditions
                visible = is_visible;
                
            }
            var entity_index = entity_instance.index;
            if(!activated) instance_deactivate_object(entity_instance);
            ds_map_add(chunk_entities, entity_index, entity_instance);
        }
    }
}
