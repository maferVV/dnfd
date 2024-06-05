guiw = display_get_gui_width();
guih = display_get_gui_height();

image_yscale = guih*0.9/sprite_get_height(sprite_index);
image_xscale = image_yscale;

backpack_yoffset_disabled = guih +sprite_height/4 + 50;
backpack_xoffset = 0+sprite_width/2;
backpack_yoffset = backpack_yoffset_disabled;

roll_xscale = image_xscale*roll_scale_modifier;
roll_yscale = image_yscale*roll_scale_modifier;
roll_width = roll_xscale*sprite_get_width(sprRollHUD);
roll_height = roll_yscale*sprite_get_height(sprRollHUD);
roll_xoffset = guiw/2 - guiw*0.2 -roll_width/2; ///////
roll_yoffset = display_get_gui_height()/2 - roll_height/2;
dice_xoffset = guiw/2 + guiw*0.2; ////////
dice_yoffset = guih/2 - guih*0.05;
dice_xscale = image_xscale*dice_scale_modifier;
dice_yscale = image_yscale*dice_scale_modifier;
dice_width = dice_xscale*sprite_get_width(sprDiceFace);
dice_height = dice_yscale*sprite_get_width(sprDiceFace);
