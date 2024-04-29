/// collision_fov_list(x1, y1, obj, radius, dir, fov_angle, notme)
// Returns a list of objects inside fov
{
    var x1,y1,obj,radius,dir,fov_angle,notme,dsid;
    x1 = argument0;
    y1 = argument1;
    obj = argument2;
    radius = argument3;
    dir = argument4;
    fov_angle = argument5;
    notme = argument6;
    dsid = ds_list_create();
    
    with(obj)
    {
        if (!notme || id != other.id)
        {
            var ang = point_direction(x1, y1, x, y);
            if( (distance_to_object(other.id) < radius)
                && ( abs(angle_difference(dir, ang)) < fov_angle/2) )
                ds_list_add(dsid,id);
        }
    }
    
    if(ds_list_empty(dsid))
    {
        ds_list_destroy(dsid);
        dsid = noone;
    }
    return dsid;
}
