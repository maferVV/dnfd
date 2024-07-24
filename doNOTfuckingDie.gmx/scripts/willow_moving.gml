if(state_new)
{
    tmc_dt_set_friction(fric);
    dt_image_speed = 10/60;
    facedir = movedir;
}

var dt = global.tmc_dt_delta_t;

willow_readInputs();
tmc_dt_step_full();

set_depth();

willow_set_running_sprite();
willow_manage_interaction();

if(input_direction != -1)
{
    if( place_meeting_3D(x, y, z, collision_object) )
    {
        sprArm = noone;
        state_switch("stuck");
    }
    willow_movedir_move();
}
else
{
    sprArm = noone;
    state_switch("idle");
}
