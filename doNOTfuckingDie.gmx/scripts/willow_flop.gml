if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprWillowStuck;
    dt_image_speed = 0;
    dt_image_index = random( sprite_get_number(sprite_index) );
}

willow_readInputs();
tmc_dt_step_full();

if(isPlayerControlled)
{
    state_switch("idle");
}
