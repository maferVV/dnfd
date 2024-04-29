
// shoot boolet
if(global.tmc_dt_time>next_bullet_time)
{
    if(keyboard_check(vk_control))
    {
        var spd = tmc_dt_get_speed();
        with(instance_create(x,y,tmc_dt_demo_bullet))
        {
            image_angle = other.image_angle;
            tmc_dt_motion_set(image_angle,4*global.desired_fps+spd);
            
            
        }
       next_bullet_time = global.tmc_dt_time+bullet_per_sec_delay;
    }
}
move_wrap(true, true, sprite_width/2); 

