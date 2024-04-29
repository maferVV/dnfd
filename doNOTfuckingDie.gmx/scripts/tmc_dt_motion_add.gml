///tmc_dt_motion_add(direction, speed)
/*
    adds motion to an instance

    direction is the direction of the motion
    speed is the speed to add to the motion
    SPEED is in pixels per second, not per step!!!
*/
dt_hspeed += lengthdir_x(argument1,argument0)*global.desired_fps*global.tmc_dt_delta_t;
dt_vspeed += lengthdir_y(argument1,argument0)*global.desired_fps*global.tmc_dt_delta_t;
