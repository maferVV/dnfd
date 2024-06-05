if(state_new)
{
    draw_roll_check = true;
    var sep = 0.55;
    dice1 = instance_create(dice_xoffset - dice_width*sep, dice_yoffset, objInterfaceDice);
    with(dice1){ player_interface = other.id; }
    dice2 = instance_create(dice_xoffset + dice_width*sep, dice_yoffset, objInterfaceDice);
    with(dice2){ player_interface = other.id; }
}
player_interface_manage_cursor();
player_interface_snapback_scale();




if(false)
{
    with(player){willow_give_control();}
    fg_alpha = 0;
    objGameManager.canPause = true;
}
