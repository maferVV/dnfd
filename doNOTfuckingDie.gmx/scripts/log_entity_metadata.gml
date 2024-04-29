/// log_entity_metadata(entityid, type_str, value)
// Logs to the metadata regarding a respective id
// First data to log should be "object"
//
// Valid type_strs:
//  - object
//  - x
//  - y
//  - z
//  - sprite_index
//  - image_index
//  - dt_image_index
//  - image_speed
//  - dt_image_speed
//  - state
//  - isHappy
//  - etc
{
    var entityid, type_str, value, map;
    entityid = argument0;
    type_str = argument1;
    value = argument2;
    map = ds_map_find_value(entity_metadata, entityid);
    if( is_undefined(map) )
    {
        map = ds_map_create();
        ds_map_add_map(entity_metadata, entityid, map);
    }
    
    ds_map_add(map, type_str, value);
    
}
