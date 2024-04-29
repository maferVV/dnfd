/// instance_place_3D(x, y, z, obj)
// returns id or noone

{
    var xx, yy, zz, obj, list, zdiff;
    xx = argument0;
    yy = argument1;
    zz = argument2;
    obj = argument3;
    
    // 2D exception
    if(collision_type == bbox_type.simple)
        return instance_place(xx, yy, obj);
    
    zdiff = z - zz;
    list = instance_place_list(xx, yy, obj);
    if(list != noone)
    {
        for(var i = 0; i < ds_list_size(list); i++)
        {
            instance = ds_list_find_value(list, i);
            if( ranges_overlap(bbox_back - zdiff, bbox_front - zdiff, instance.bbox_back, instance.bbox_front) )
            {
               ds_list_destroy(list);
               return instance.id;
            }
        }
    }
    
    return noone;
}
