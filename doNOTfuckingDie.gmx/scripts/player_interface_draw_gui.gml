/// player_interface_draw_gui()

if(!draw_dice_roll)
    player_interface_draw_background();

player_interface_draw_backpack();
player_interface_draw_blueprint();
player_interface_draw_equiped();

// roll check
if(draw_dice_roll)
{
    player_interface_draw_background();
    if(draw_dice_info)
        player_interface_draw_dice_info();
    player_interface_draw_dice_roll();
}

if(debug)
    player_interface_draw_inventory_info();

draw_set();


