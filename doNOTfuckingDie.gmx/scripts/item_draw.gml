var subimg = 0;
if(is_hover) subimg = 1;
draw_sprite_ext(item_name_to_sprite(item_name),
                subimg,
                x,
                y + yoffset,
                image_xscale,
                image_yscale,
                image_angle,
                image_blend,
                image_alpha
                );

