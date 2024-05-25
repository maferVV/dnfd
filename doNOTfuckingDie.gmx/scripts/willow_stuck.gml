if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprWillowStuck;
    dt_image_speed = 9/60;
    dt_image_index = 0;
}

var dt = global.tmc_dt_delta_t;

willow_readInputs();
tmc_dt_step_full();
tmc_dt_step_unstuck(input_direction);

depth = -decimal_bbox_bottom();

if( !place_meeting_3D(x, y, z, collision_object) )
{
    state_switch("idle");
}
