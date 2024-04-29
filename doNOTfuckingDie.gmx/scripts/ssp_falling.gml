if(state_new)
{
    //sprite_index = sprSSP_fall;
    //dt_image_speed = 5/60;
    print("falling");
}

if(!objGameManager.paused) ssp_readInputs();

if(attack_pressed)
    state_switch("attack");

tmc_dt_step_full();

if(dir_down != 0)
{
    spd = approach(spd, spdMax*dir_down, acc*global.delta_step);
    tmc_dt_set_hspeed( spd );
}

if( is_grounded() )
    state_switch("landing");
