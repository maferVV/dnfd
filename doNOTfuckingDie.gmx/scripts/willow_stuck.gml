if(state_new)
{
    tmc_dt_set_friction(fric);
    sprite_index = sprWillowStuck;
    dt_image_speed = 12/60;
    dt_image_index = 0;
    stuck_sound = noone;
    
    dt_alarm[0] = 2;
}

var dt = global.tmc_dt_delta_t;

willow_readInputs();
tmc_dt_step_full();
tmc_dt_step_unstuck(input_direction);
willow_item_interaction();
depth = -decimal_bbox_bottom();

if( !place_meeting_3D(x, y, z, collision_object) )
{
    dt_alarm[0] = -1;
    state_switch("idle");
}
