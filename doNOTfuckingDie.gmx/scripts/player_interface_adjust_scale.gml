image_yscale = display_get_gui_height()*0.9/sprite_get_height(sprite_index);
image_xscale = image_yscale;

backpack_yoffset_disabled = display_get_gui_height() +sprite_height/4 + 50;
backpack_xoffset = 0+sprite_width/2;
backpack_yoffset = backpack_yoffset_disabled;

roll_xoffset = display_get_gui_width()/2 - sprite_get_width(sprRollHUD)*image_xscale/2;
roll_yoffset = display_get_gui_height()/2 - sprite_get_height(sprRollHUD)*image_yscale/2;
