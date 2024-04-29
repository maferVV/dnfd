if(state_new)
{
    tmc_dt_set_friction(20);
    sprite_index = sprLuzIdle;
    dt_image_speed = 0;
    //sprite_index = sprSSP_idle;
    //dt_image_speed = 5/60;
    print("idle");
}

if(!objGameManager.paused) ssp_readInputs();

tmc_dt_step_full();

if !is_grounded()
{
    tmc_dt_set_friction(0);
    state_switch("falling");
}

if(jump_pressed)
{
    tmc_dt_set_friction(0);
    state_switch("jump");
}

if(attack_pressed)
{
    tmc_dt_set_friction(0);
    state_switch("attack");
}

if(dir_down != 0)
{
    tmc_dt_set_friction(0);
    state_switch("moving");
}
