/// player_interface_draw_gui()

var guiw = display_get_gui_width();
var guih = display_get_gui_height();

// background
draw_set(fg_alpha, fg_color);
draw_rectangle(-32, -32, guiw+32, guih+32, false);

// backpack
if( (state_name == "disabled")||(state_name == "toDisabled") )
    draw_sprite_outlined(sprite_index, 0, backpack_xoffset, backpack_yoffset, image_xscale+backpack_xscale_bounce, image_yscale+backpack_yscale_bounce, image_angle, image_blend, merge_colour(c_dkgray, c_black, 0.75));
else
    draw_sprite_ext(sprite_index, 0, backpack_xoffset, backpack_yoffset, image_xscale+backpack_xscale_bounce, image_yscale+backpack_yscale_bounce, image_angle, image_blend, image_alpha);

// roll check
if(draw_roll_check)
{
    draw_sprite_ext(sprRollHUD, 11, roll_xoffset, roll_yoffset,
                    image_xscale, image_yscale,
                    image_angle, check_red, image_alpha);
    var subimg = map_value(roll_number, 2, 12, 1, 11);
    draw_sprite_ext(sprRollHUD, subimg, roll_xoffset, roll_yoffset,
                    image_xscale, image_yscale,
                    image_angle, check_green, image_alpha);
                    
    for(var i = 0; i < 11; i++)
    {
        var w = (sprite_get_width(sprRollHUD)*image_xscale)/11;
        var xx = roll_xoffset + w*i;
        var yy = roll_yoffset + sprite_get_height(sprRollHUD)*image_yscale/2;
        draw_debug_point(xx, yy, string(i+2));
    }
    
}    
draw_set();


