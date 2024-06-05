draw_sprite_ext(sprRollHUD, 0, roll_xoffset, roll_yoffset,
                roll_xscale, roll_yscale,
                image_angle, c_white, image_alpha);

draw_sprite_part_ext(sprRollHUD2, 0, 0, 0,
                    roll_draw_part_w, roll_draw_part_h,
                    roll_xoffset, roll_yoffset,
                    roll_xscale, roll_yscale,
                    c_white, image_alpha);

// Draw numbers
for(var i = 0; i < 11; i++)
{
    var xx = roll_xoffset + w_col*i + w_nopad/2;
    var yy = roll_yoffset + roll_height;
    draw_set(1, c_white, fnt_rubik, fa_center, fa_bottom);
    draw_text_outlined(xx, yy, string(i+2), c_white, c_black);
}
// Draw llave with percentage
draw_9slice(llave_x, llave_y, llave_w, llave_h, sprLlave9s, 0);
draw_set(1, c_white, fnt_rubik, fa_center, fa_top);
draw_text_outlined(llave_tx, llave_ty, string(check_percentage) + "%", make_colour_rgb(128,255,128), c_black);

// Draw text on top
draw_set(1, c_white, fnt_rubik_menubig, fa_center, fa_middle);
draw_text_outlined(roll_title_x, roll_title_y, roll_title, c_white, c_black);
draw_set();

// Draw Dice subtitles
draw_set(1, c_white, fnt_rubik, fa_center, fa_middle);
draw_text_outlined(dice_text_x, dice_text_y, dice_text, c_white, c_black);
draw_set();

