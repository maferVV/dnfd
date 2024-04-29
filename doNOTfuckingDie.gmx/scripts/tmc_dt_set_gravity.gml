///tmc_dt_set_gravity(direction, gravity)
/*
    sets an instance gravity

    equivalent to
    gravity_direction = <value>
    combined with
    gravity = <value>
    direction is the direction of the gravity
    gravity is the applied gravity speed per second
    gravity is in pixels per second, not per step!!!
*/
dt_gravh = lengthdir_x(argument1,argument0);
dt_gravv = lengthdir_y(argument1,argument0);
