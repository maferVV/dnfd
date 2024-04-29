if(state_new)
{   
    sprite_index = sprLuzRun;
    dt_image_speed = 9/60;
    //sprite_index = sprSSP_run;
    print("moving");
}

dt_image_speed = lerp(0, 20/60, abs(spd)/spdMax );

if(!objGameManager.paused) ssp_readInputs();

if !is_grounded()
    state_switch("falling");

if(jump_pressed)
    state_switch("jump");
    
if(attack_pressed)
    state_switch("attack");
    
if(dir_down != 0)
{
    tmc_dt_step_full();
    spd = approach(spd, spdMax*dir_down, acc*global.delta_step);
    tmc_dt_set_hspeed( spd );
    draw_dir = dir_down;
}
else
    state_switch("idle");
