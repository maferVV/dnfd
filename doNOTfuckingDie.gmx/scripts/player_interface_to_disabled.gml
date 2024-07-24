if(state_new)
{
    with(player){willow_give_control();}
    
    fg_alpha = 0;
    
    
    
    yoffset_anim_max = 50;
    yoffset_anim_index = 0;    
    
    player_interface_adjust_scale();
    
    inventory_item_equiped = noone;
    
    with(objPlayerInterfaceItem)
    {
        interface_item_put_away();
    }
}

yoffset_anim_index += global.delta_step;
yoffset_anim_index = clamp(yoffset_anim_index, 0, yoffset_anim_max);
var curve = EaseInOutQuint(yoffset_anim_index, 0, 1, yoffset_anim_max);
backpack_yoffset = map_value(curve, 0, 1, backpack_yoffset_enabled, backpack_yoffset_disabled); 

var curve2 = EaseInBack(yoffset_anim_index, 0, 1, yoffset_anim_max);
blueprint_y = map_value(curve2, 0, 1, blueprint_y_enabled, blueprint_y_disabled);

if( yoffset_anim_index==yoffset_anim_max )
    state_switch("disabled");
    
player_interface_read_inputs();
player_interface_snapback_scale();
if(inventory_pressed)
    state_switch("toInventory");
