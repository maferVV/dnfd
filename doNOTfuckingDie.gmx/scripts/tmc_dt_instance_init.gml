///tmc_dt_instance_init()
/*
    creates the variables the instance will need
    for delta time, collisions and movement.
    
    Notes:
    - Use dt_image_speed instead of image_index.
    - Use dt_image_index instead of image_index.
    - Use dt_alarm.
*/

// speeds
dt_hspeed = 0;
dt_vspeed = 0;
dt_friction = 0;
dt_gravh = 0;
dt_gravv = 0;

// 3D
init_collisions_3D();
dt_zspeed = 0;
dt_gravz = 0;

// collision related
bounce = 1;
collision_object = noone;

tmc_dt_alarm_init();

tmc_dt_image_speed_init();
