if(state_new)
{
    tmc_dt_set_friction(fric);
}

// d is the 360 direction of the inputs
var d = inputdog_direction("up","down","left","right",playerSlot);
var dt = global.tmc_dt_delta_t;
// move entity
tmc_dt_step_full();

if(d != -1)
{
    //if(state_new) movedir = angle_normalize(d-view_angle);
    movedir = angle_approach(movedir, angle_normalize(d-view_angle), dirspd*global.desired_fps);
    if(tmc_dt_get_speed() < maxspd)
        tmc_dt_motion_add(movedir, movespd*global.desired_fps);
    else
        tmc_dt_set_speed(maxspd);
    tmc_dt_set_direction(movedir);
}
else
    state_switch("idle");
