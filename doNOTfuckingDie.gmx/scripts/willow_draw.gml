/// willow_draw();


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
