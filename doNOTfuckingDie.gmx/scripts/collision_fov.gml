/// collision_fov(x1, y1, obj, radius, dir, fov_angle, notme)
// Returns an instance inside the fov angle
{
    var x1,y1,obj,radius,dir,fov_angle,notme, retval;
    x1 = argument0;
    y1 = argument1;
    obj = argument2;
    radius = argument3;
    dir = argument4;
    fov_angle = argument5;
    notme = argument6;
    retval = false;
    
    with(obj)
    {
        if (!notme || id != other.id)
        {
            var ang = point_direction(x1, y1, x, y);
            if( (distance_to_object(other.id) < radius)
                && ( abs(angle_difference(dir, ang)) < fov_angle/2) )
                return id;
        }
    }
    
    return noone;
}
