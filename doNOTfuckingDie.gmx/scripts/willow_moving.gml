if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprWillowRun;
    dt_image_speed = 9/60;
    dt_image_index = 0;
}

var dt = global.tmc_dt_delta_t;

willow_readInputs();
tmc_dt_step_full();

depth = -decimal_bbox_bottom();

if(input_direction != -1)
{
    willow_movedir_move();
}
else
    state_switch("idle");
