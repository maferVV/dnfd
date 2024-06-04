if(state_new)
{
    with(player){willow_withdraw_control();}
    
    fg_alpha = 0.6;
    fg_color = c_black;
    
    player_interface_adjust_scale();
}

state_switch("diceCheck");
