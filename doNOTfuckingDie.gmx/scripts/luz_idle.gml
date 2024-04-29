if(state_new)
{
    tmc_dt_set_friction(idlefric);
    sprite_index = sprLuzIdle;
    dt_image_speed = 0;
    dt_image_index = 0;
    dt_animation_end_execute = scrLuzIdleBlinkEnd;
}

if random(50)<1
{
    dt_image_speed = 18/60;
    dt_image_index = 0;
    
    sprite_index = sprLuzIdleBlink;
}   

// d is the 360 direction of the inputs
luz_readInputs();
tmc_dt_step_full();

if(action1)
{
    with(instance_create(x, y, objDig))
    {
        resize(0.25);
        follow = other;
        so_whitelist(id, other);
    }
}

if(input_direction != -1)
    state_switch("moving");

