movedir = angle_normalize(input_direction-view_angle);
if(tmc_dt_get_speed() < maxspd)
    tmc_dt_motion_add(movedir, movespd*global.desired_fps);
else
    tmc_dt_set_speed(maxspd);
tmc_dt_set_direction(movedir);
draw_angle = movedir;

image_xscale = abs(image_xscale) * angle_to_left_right(input_direction);
