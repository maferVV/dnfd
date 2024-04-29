if(state_new)
{
    sprite_index = sprBatFlying;
    dt_image_speed = 20/60;
}

tmc_dt_step_full();
draw_dir = angle_to_left_right( tmc_dt_get_direction() );

if( collision_circle(x, y, 100, objCatHero, true, true) )
    state_switch(bat_pursue);
