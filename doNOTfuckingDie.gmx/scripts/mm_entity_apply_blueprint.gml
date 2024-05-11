/// mm_entity_apply_blueprint( entity_blueprints )
// Recieves a map
{
    var entity_blueprints = argument0;
    for(var type_str = ds_map_find_first(entity_blueprints); !is_undefined(type_str); type_str = ds_map_find_next(entity_blueprints, type_str))
    {
        var value = entity_blueprints[? type_str];
        switch(type_str)
        {
            case "x":
            case "y":
                //already set in creation event
                break;
            case "image_alpha": image_alpha = real(value); break;
            case "image_blend": image_blend = real(value); break;
            case "sprite_index": sprite_index = real(value); break;
            case "dt_image_speed": dt_image_speed = real(value); break;
            case "dt_image_index": dt_image_index = real(value); break;
            case "stack_anim_array[0]": stack_anim_array[0] = real(value); break; // for 3d
            //default: error("var for "+type_str+" not found", 0); break;
        }
    }
}
