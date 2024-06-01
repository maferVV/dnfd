if(state_new)
{
    with(player){willow_give_control();}
    
    fg_alpha = 0;
}
player_interface_read_inputs();
if(inventory_pressed)
    state_switch("inventory");
