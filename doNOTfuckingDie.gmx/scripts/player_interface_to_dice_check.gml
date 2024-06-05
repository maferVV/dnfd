if(state_new)
{
    with(player){willow_withdraw_control();}
    
    fg_alpha = 0.8;
    fg_color = c_black;
    
    player_interface_adjust_scale();
    player_interface_set_draw_vars();
    
    objGameManager.canPause = false;
}

state_switch("diceCheck");
