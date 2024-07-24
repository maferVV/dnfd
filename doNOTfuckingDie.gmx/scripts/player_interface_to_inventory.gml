if(state_new)
{
    with(player){willow_withdraw_control();}
    
    fg_alpha = 0.6;
    fg_color = c_black;
    
    yoffset_anim_max = 30;
    yoffset_anim_index = 0;    
    player_interface_adjust_scale();
}

yoffset_anim_index += global.delta_step;
yoffset_anim_index = clamp(yoffset_anim_index, 0, yoffset_anim_max);
var curve = EaseInOutBack(yoffset_anim_index, 0, 1, yoffset_anim_max);
backpack_yoffset = map_value(curve, 0, 1, backpack_yoffset_disabled, backpack_yoffset_enabled);

var curve2 = EaseOutBack(yoffset_anim_index, 0, 1, yoffset_anim_max);
blueprint_y = map_value(curve2, 0, 1, blueprint_y_disabled, blueprint_y_enabled);

if(yoffset_anim_index == yoffset_anim_max)
    state_switch("inventory");
    
player_interface_read_inputs();
player_interface_snapback_scale();
if(inventory_pressed)
    state_switch("toDisabled");
