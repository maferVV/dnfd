if(state_new)
{
    with(player){willow_give_control();}
    
    fg_alpha = 0;
    
    image_yscale = display_get_gui_height()*0.9/sprite_get_height(sprite_index);
    image_xscale = image_yscale;
    
    yoffset_anim_max = 50;
    yoffset_anim_index = 0;    
    backpack_yoffset_disabled = display_get_gui_height() +sprite_height/4 + 50;
    backpack_yoffset_enabled = display_get_gui_height() - sprite_height/2;
    
    backpack_xoffset = 0 +sprite_width/2;
    
    with(objPlayerInterfaceItem)
    {
        interface_item_put_away();
    }
}

yoffset_anim_index += global.delta_step;
yoffset_anim_index = clamp(yoffset_anim_index, 0, yoffset_anim_max);
var curve = EaseOutBounce(yoffset_anim_index, 0, 1, yoffset_anim_max);
backpack_yoffset = map_value(curve, 0, 1, backpack_yoffset_enabled, backpack_yoffset_disabled); 

if( yoffset_anim_index==yoffset_anim_max )
    state_switch("disabled");
    
player_interface_read_inputs();
if(inventory_pressed)
    state_switch("toInventory");
