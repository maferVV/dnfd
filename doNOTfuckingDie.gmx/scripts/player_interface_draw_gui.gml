/// player_interface_draw_gui()

if(!draw_roll_check)
    player_interface_draw_background();

player_interface_draw_backpack();

// roll check
if(draw_roll_check)
{
    player_interface_draw_background();
    player_interface_draw_dice_check();
}

draw_set();


