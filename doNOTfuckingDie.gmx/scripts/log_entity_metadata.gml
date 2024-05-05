/// log_entity_metadata(chunk, entityid, type_str, value)
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
    var chunk, entityid, type_str, value, map;
    chunk = argument0;
    entityid = argument1;
    type_str = argument2;
    value = argument3;
    map = chunk[? entityid];
    if( is_undefined(map) )
    {
        // Create ds for new entity 
        map = ds_map_create();
        ds_map_add_map(chunk, entityid, map);
    }
    // Adds entity to chunk ds
    ds_map_add(map, type_str, value);
    
    if(type_str == "obj")
    {
        print_vars("chunkid", chunk, "entityid", entityid);
    }
    
}
