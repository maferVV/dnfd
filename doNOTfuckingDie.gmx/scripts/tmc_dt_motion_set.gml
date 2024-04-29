///tmc_dt_motion_set(direction, speed)
/*
    sets an instance into motion

    direction is the direction of the motion
    speed is the speed of the motion
    SPEED is in pixels per second, not per step!!!
*/
dt_hspeed = lengthdir_x(argument1,argument0);
dt_vspeed = lengthdir_y(argument1,argument0);
