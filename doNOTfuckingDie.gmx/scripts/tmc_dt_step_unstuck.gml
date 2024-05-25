/// tmc_dt_step_unstuck(dir)
// unstucks player if inside a wall

if ( place_meeting_3D(x, y, z, collision_object) )
{
    // inside a wall
    var len = 16*global.tmc_dt_delta_t;
    var dir = argument0*gauss(0,20);
    x += lengthdir_x(len, dir);
    y += lengthdir_y(len, dir);
}
