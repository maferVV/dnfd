/// willow_draw();

if(debug)
{
    draw_set(0.6, c_fuchsia);
    var x2 = x + lengthdir_x(interact_radius, facedir);
    var y2 = decimal_bbox_bottom() + lengthdir_y(interact_radius, facedir);
    draw_line_width_colour(x, decimal_bbox_bottom(), x2, y2, 0.5, c_red, c_blue)
    draw_fov(x, decimal_bbox_bottom(), interact_radius, facedir, interact_aperture);
    draw_set();
}

draw_sprite_ext(sprite_index,
                dt_image_index,
                x,
                y,
                image_xscale, 
                image_yscale, 
                image_angle,
                image_blend, 
                image_alpha);
                
if(sprite_exists(sprArm))
{
    draw_sprite_ext(sprArm,
                    dt_image_index,
                    x,
                    y,
                    image_xscale, 
                    image_yscale, 
                    image_angle,
                    image_blend, 
                    image_alpha);
}
