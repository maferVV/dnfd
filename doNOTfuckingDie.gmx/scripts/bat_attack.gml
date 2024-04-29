if(state_new)
{
    sprite_index = sprBatAttack;
    dt_image_speed = 20/60;
}

var xx = objCatHero.x;
var yy = objCatHero.y;
tmc_dt_add_towards_point(xx, yy, spdMax);
tmc_dt_step_full();
draw_dir = angle_to_left_right( tmc_dt_get_direction() );

// switch back in anim end script
