if(state_new)
{
    player_interface_adjust_scale();
    backpack_yoffset = backpack_yoffset_enabled;
    blueprint_y = blueprint_y_enabled;
    
    // spawn items inside
    for(var i = 0; i < ds_list_size(inventory); i++)
    {
        var inventory_item = inventory[| i];
        var xx = inventory_item[? "x"];
        var yy = inventory_item[? "y"];
        
        var ins = instance_create(backpack_xoffset+xx, backpack_yoffset+yy, objPlayerInterfaceItem);
        with(ins) {interface_item_appear(other.id, i, inventory_item);}
    }
}

player_interface_manage_cursor();
player_interface_read_inputs();
player_interface_snapback_scale();

if(inventory_pressed)
    state_switch("toDisabled");
