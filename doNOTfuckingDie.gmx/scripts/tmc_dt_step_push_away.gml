/// tmc_dt_step_push_away(obj)
// Move away from other items im colliding with
{
    var objpush = argument0;
    var cols = instance_place_list(x, y, objpush);
    average_x = 0;
    average_y = 0;
    if( cols != noone)
    {
        for(var i = 0; i < ds_list_size(cols); i++)
        {
            var ins = cols[| i];
            average_x += ins.x;
            average_y += ins.y;
        }
        average_x /= ds_list_size(cols);
        average_y /= ds_list_size(cols);
        ds_list_destroy(cols);
        var dir = point_direction(average_x, average_y, x, y);
        tmc_dt_motion_add(dir, 10);
    }
}
