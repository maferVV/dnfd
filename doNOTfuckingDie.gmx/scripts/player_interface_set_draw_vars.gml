roll_draw_part_w = map_value(check_number, 2, 12,
                                sprite_get_width(sprRollHUD)/11,
                                sprite_get_width(sprRollHUD));
roll_draw_part_h = sprite_get_height(sprRollHUD);

// Get section vars
w_col = roll_width/11;
w_pad = w_col*(1/15);
w_nopad = w_col - w_pad;

llave_x = roll_xoffset;
llave_y = roll_yoffset + roll_height + (w_pad*3);
llave_w = w_col*(check_number-1);
llave_h = sprite_get_height(sprLlave9s);

check_percentage = num_to_percentage_2d6(check_number);
llave_tx = llave_x + llave_w/2;
llave_ty = llave_y + sprite_get_height(sprLlave9s)/2;

roll_title = string(check_name) + " - Roll "
            + string(check_number) + " or less."
            + "#" + "Chance of success: "
            + string(check_percentage) + "%.";
roll_title_x = roll_xoffset + roll_width/2;
roll_title_y = roll_yoffset - string_height(roll_title) - (w_pad*2);


dice_text = "Press ["+nat(inputdog_get_key_of_input(1,"interact"))+"] to throw the dice."
            +"#"+"Press ["+nat(inputdog_get_key_of_input(1,"pause"))+"] to exit this check."
dice_text_x = dice_xoffset;
dice_text_y = dice_yoffset + dice_height;
