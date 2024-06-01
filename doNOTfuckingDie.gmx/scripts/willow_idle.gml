if(state_new)
{
    tmc_dt_set_friction(idlefric);
    sprite_index = sprWillowIdle;
    dt_image_speed = 0;
    dt_animation_end_execute = scrWillowIdleBlinkEnd;
}

// blink
if random(50)<1
{
    dt_image_speed = 18/60;
    dt_image_index = 0;
    
    sprite_index = sprWillowIdleBlink;
}   

depth = -decimal_bbox_bottom();

// d is the 360 direction of the inputs
willow_readInputs();
tmc_dt_step_full();


if(input_direction != -1)
    state_switch("moving");

