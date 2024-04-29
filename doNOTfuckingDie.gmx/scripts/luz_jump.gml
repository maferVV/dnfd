if state_new
{
    
    sprite_index = sprLuzRun;
    dt_image_index = 2;
    dt_image_speed = 0;
}

luz_readInputs();
tmc_dt_step_full();

if(input_direction != -1)
{
    luz_movedir_move();
}
else
    state_switch("idle");
