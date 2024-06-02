/// player_interface_draw_gui()

var guiw = display_get_gui_width();
var guih = display_get_gui_height();

draw_set(fg_alpha, fg_color);
draw_rectangle(-32, -32, guiw+32, guih+32, false);

if( (state_name == "disabled")||(state_name == "toDisabled") )
    draw_sprite_outlined(sprite_index, 0, backpack_xoffset, backpack_yoffset, image_xscale, image_yscale, image_angle, image_blend, merge_colour(c_dkgray, c_black, 0.75));
else
    draw_sprite_ext(sprite_index, 0, backpack_xoffset, backpack_yoffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_set();


