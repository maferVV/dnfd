if(state_new)
{
    backpack_yoffset_enabled = display_get_gui_height() - sprite_height/2;
    backpack_yoffset = backpack_yoffset_enabled;
    
    // spawn items inside
    for(var k = ds_map_find_first(inventory); !is_undefined(k); k = ds_map_find_next(inventory, k))
    {
        var inventory_item = inventory[? k];
        var xx = inventory_item[? "x"];
        var yy = inventory_item[? "y"];
        
        var ins = instance_create(backpack_xoffset+xx, backpack_yoffset+yy, objPlayerInterfaceItem);
        with(ins) {interface_item_appear(other.id, k, inventory_item);}
    }
}

player_interface_manage_cursor();
player_interface_read_inputs();
player_interface_snapback_scale();
if(inventory_pressed)
    state_switch("toDisabled");
