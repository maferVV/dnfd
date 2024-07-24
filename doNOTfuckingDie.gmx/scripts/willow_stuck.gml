if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprWillowStuck;
    dt_image_speed = 12/60;
    dt_image_index = random( sprite_get_number(sprite_index) );
    stuck_sound = noone;
    
    dt_alarm[0] = 2;
}

var dt = global.tmc_dt_delta_t;

if(random(5) < 1)
    image_xscale = -image_xscale;
willow_readInputs();
tmc_dt_step_full();
tmc_dt_step_unstuck(input_direction);
set_depth();

if( !place_meeting_3D(x, y, z, collision_object) )
{
    image_xscale = abs(image_xscale);
    dt_alarm[0] = -1;
    state_switch("idle");
}
