if(state_new)
{
    with(player){willow_withdraw_control();}
    
    fg_alpha = 0.3;
    fg_color = c_dkgray;
    
}
player_interface_read_inputs();
if(inventory_pressed)
    state_switch("disabled");
