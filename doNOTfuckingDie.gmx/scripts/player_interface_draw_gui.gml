/// player_interface_draw_gui()

if(!draw_dice_roll)
    player_interface_draw_background();

player_interface_draw_backpack();

// roll check
if(draw_dice_roll)
{
    player_interface_draw_background();
    if(draw_dice_info)
        player_interface_draw_dice_info();
    player_interface_draw_dice_roll();
}

draw_set();


