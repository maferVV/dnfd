if(state_new)
{
    tmc_dt_set_friction(20);
    sprite_index = sprSSP_landing;
    dt_image_speed = 9/60;
    screenfreeze(2);
    print("land");
}

if(!objGameManager.paused) ssp_readInputs();

tmc_dt_step_full();

if !is_grounded()
{
    tmc_dt_set_friction(0);
    state_switch("falling");
}

if(attack_pressed)
{
    tmc_dt_set_friction(0);
    state_switch("attack");
}
    
if(jump_pressed)
{
    tmc_dt_set_friction(0);
    state_switch("jump");
}

if(dir_down != 0)
{
    tmc_dt_set_friction(0);
    state_switch("moving");
}

if( state_timer >= 15 )
{
    state_switch("idle");
}
