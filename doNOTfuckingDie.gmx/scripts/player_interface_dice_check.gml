if(state_new)
{
    draw_dice_roll = true;
    draw_dice_info = true;
    
    // spawn dice
    var sep = 0.55;
    dice1 = instance_create(dice_xoffset - dice_width*sep, dice_yoffset, objInterfaceDice);
    with(dice1){ player_interface = other.id; }
    dice2 = instance_create(dice_xoffset + dice_width*sep, dice_yoffset, objInterfaceDice);
    with(dice2){ player_interface = other.id; }
}

player_interface_snapback_scale();
player_interface_read_inputs();



if(pause_pressed && can_skip_check)
{
    with(player){willow_give_control();}
    fg_alpha = 0;
    objGameManager.canPause = true;
    draw_dice_roll = false;
    draw_dice_info = false;
    instance_destroy(dice1);
    instance_destroy(dice2);
    state_switch("disabled");
}

if(interact_pressed)
{
    state_switch("diceCheckThrow");
}
