if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprLuzRun;
    dt_image_speed = 9/60;
    dt_image_index = 0;
}

var dt = global.tmc_dt_delta_t;

luz_readInputs();
tmc_dt_step_full();


if(input_direction != -1)
{
    luz_movedir_move();
}
else
    state_switch("idle");
