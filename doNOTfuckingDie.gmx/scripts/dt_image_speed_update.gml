/// dt image speed
dt_image_index += dt_image_speed * global.delta_step;
if(abs(dt_image_index) >= sprite_get_number(sprite_index))
{
    dt_image_index = 0;
    if((dt_animation_end_execute!=noone)&&script_exists(dt_animation_end_execute))
        script_execute(dt_animation_end_execute);   
}
