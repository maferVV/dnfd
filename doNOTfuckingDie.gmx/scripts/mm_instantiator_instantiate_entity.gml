/// mm_instantiator_instantiate_entity(chunk_entities, entity_blueprints, _index, _chunk_x, _chunk_y, is_visible, activated)
// Instantiates an entity given a blueprint, gives it its proper context, visibility, activation.
// Finally, adds entity instance reference into chunk_entities.
//     - Returns: instantiated entiy id.
{
    var chunk_entities, entity_blueprints, _index, _chunk_x, _chunk_y, is_visible, activated;
    chunk_entities = argument0;
    entity_blueprints = argument1;
    _index = argument2;
    _chunk_x = argument3;
    _chunk_y = argument4;
    is_visible = argument5;
    activated = argument6;
    
    var obj = entity_blueprints[? "obj"];
    var xx = entity_blueprints[? "x"];
    var yy = entity_blueprints[? "y"];
    var entity_instance = instance_create(xx, yy, obj);
    with(entity_instance)
    {
        mm_entity_create();
        instantiator = other.id;
        index = _index;
        chunk_x = _chunk_x;
        chunk_y = _chunk_y;
        mm_entity_apply_blueprint(entity_blueprints);
        // Starting conditions
        visible = is_visible;
        
    }
    var entity_index = entity_instance.index;
    if(!activated) instance_deactivate_object(entity_instance);
    ds_map_add(chunk_entities, entity_index, entity_instance);
    
    return entity_instance;
}
