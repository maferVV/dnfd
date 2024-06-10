/// mm_entity_apply_blueprint( entity_blueprints )
// Recieves a map
{
    var entity_blueprints = argument0;
    for(var type_str = ds_map_find_first(entity_blueprints); !is_undefined(type_str); type_str = ds_map_find_next(entity_blueprints, type_str))
    {
        var value = entity_blueprints[? type_str];
        switch(type_str)
        {
            case "obj":
            case "x":
            case "y":
                //already set in creation event
                break;
            case "image_alpha": image_alpha = real(value); break;
            case "image_blend": image_blend = real(value); break;
            case "sprite_index": sprite_index = real(value); break;
            case "dt_image_speed": dt_image_speed = real(value); break;
            case "dt_image_index": dt_image_index = real(value); break;
            case "debug_string": debug_string = string(value); break;
            case "item_name": item_name = string(value); break;
            case "is_destroyed": is_destroyed = value; break;
            case "roll_check": roll_check = value; break;
            default: error("var for "+string(type_str)+" not found", 0); break;
        }
    }
}
