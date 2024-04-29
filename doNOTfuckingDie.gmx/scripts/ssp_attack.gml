if(state_new)
{
    // vars
    hitbox = noone;
    //
    dt_vspeed -= attackJumpSpd;
    sprite_index = sprSSP_attack;
    dt_image_index = 0;
    dt_image_speed = 15/60;
    audio_play_soundy(sndSwing, 12, false, 1, 1);
}

if(!objGameManager.paused) ssp_readInputs();

if((state_timer<=2)&&(dir_down!=0))
    draw_dir = dir_down;

    
// create hitbox
var lowthres = 2;
var highthres = 3;
if( !instance_exists(hitbox) && between(dt_image_index, lowthres, highthres) )
{
    hitbox = instance_create(x, y, objForce);
    hitbox.image_yscale = 0.5;
    hitbox.image_xscale = draw_dir;
    hitbox.x += (-8*draw_dir);
    hitbox.y += -10;
    hitbox.follow = id;
    hitbox.xfollowoffset = hitbox.x - x;
    hitbox.yfollowoffset = hitbox.y - y;
    hitbox.force = 150;
    hitbox.dir = 45;
    if(draw_dir < 0) hitbox.dir = angle_reflect_y(hitbox.dir);
    hitbox.on_collision_script = onAttackHit;
    so_whitelist(hitbox, id);
}
else if((dt_image_index > highthres)&&instance_exists(hitbox))
    instance_destroy(hitbox);
    
tmc_dt_step_full();

/// ssp_onAnimEnd() switches this state back
