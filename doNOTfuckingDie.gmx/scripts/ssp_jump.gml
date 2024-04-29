if(state_new)
{
    tmc_dt_motion_set(-gravdir, jumpSpd);
    
    sprite_index = sprLuzRun;
    dt_image_speed = 0;
    dt_image_index = 2;
    //sprite_index = sprSSP_jump;
    //dt_image_speed = 9/60;
    //dt_image_index = 0;
    audio_play_soundy(sndJump, 10, false, 1, 1);
    print("jump");
}

if(!objGameManager.paused) ssp_readInputs();



if(dir_down != 0)
{
    spd = approach(spd, spdMax*dir_down, acc*global.delta_step);
    tmc_dt_set_hspeed( spd );
}

tmc_dt_step_full();

if(jump_down && (state_timer <= 0.15*global.desired_fps))
    tmc_dt_motion_add(-gravdir, jumpSpdAdd);
    
if(attack_pressed)
    state_switch("attack");

if( tmc_dt_get_vspeed() >= 0 )
    state_switch("falling");
