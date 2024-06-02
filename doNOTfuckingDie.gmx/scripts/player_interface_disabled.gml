if(state_new)
{
    with(player){willow_give_control();}
    
    fg_alpha = 0;
    
    image_yscale = display_get_gui_height()*0.9/sprite_get_height(sprite_index);
    image_xscale = image_yscale;
    
    backpack_yoffset_disabled = display_get_gui_height() +sprite_height/4 + 50;
    backpack_xoffset = 0+sprite_width/2;
    backpack_yoffset = backpack_yoffset_disabled;
    
}

player_interface_read_inputs();
if(inventory_pressed)
    state_switch("toInventory");
