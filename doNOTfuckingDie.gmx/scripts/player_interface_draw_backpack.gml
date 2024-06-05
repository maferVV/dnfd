// backpack
if( (state_name == "disabled")||(state_name == "toDisabled") )
    draw_sprite_outlined(sprite_index, 0, backpack_xoffset, backpack_yoffset,
                        image_xscale+backpack_xscale_bounce, image_yscale+backpack_yscale_bounce,
                        image_angle, image_blend, merge_colour(c_dkgray, c_black, 0.75));
else
    draw_sprite_ext(sprite_index, 0, backpack_xoffset, backpack_yoffset,
                    image_xscale+backpack_xscale_bounce, image_yscale+backpack_yscale_bounce,
                    image_angle, image_blend, image_alpha);
