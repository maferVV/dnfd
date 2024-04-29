/// chunk_instantiate_entities()
{
    for(var k = ds_map_find_first(entity_metadata);
        !is_undefined(k);
        k = ds_map_find_next(entity_metadata, k))
    {
        var metadata = entity_metadata[? k];
        if( ds_exists(metadata, ds_type_map) )
        {
            var xx = metadata[? "x"];
            var yy = metadata[? "y"];
            var obj = metadata[? "obj"];
            var entity = instance_create(xx, yy, obj);
            ds_map_add(generated_objects, k, entity);
            // extras
            var newSize = metadata[? "newSize"];
            var ialpha = metadata[? "image_alpha"];
            var iblend = metadata[? "image_blend"];
            var stack_anim_arr_0 = metadata[? "stack_anim_array[0]"];
            with(entity)
            {
                myEntityId = k;
                if( !is_undefined(newSize) ) resize(newSize);
                if( !is_undefined(ialpha) ) image_alpha = ialpha;
                if( !is_undefined(iblend) ) image_blend = iblend;
                if( !is_undefined(stack_anim_arr_0) ) stack_anim_array[0] = stack_anim_arr_0;
            }
        }
    }

}
