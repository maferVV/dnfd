/// player_interface_create()

// references
player = noone;
inventory = noone;
cursor = objCursor;

// vars
playerSlot = 1;
fg_alpha = 0;
fg_color = c_white;
inventory_pressed = false;
guiw = display_get_gui_width();
guih = display_get_gui_height();

// inventory
backpack_xoffset = 0;
backpack_yoffset = 0;
backpack_yoffset_disabled = 0;
backpack_yoffset_enabled = 0;
backpack_xscale_bounce = 0;
backpack_yscale_bounce = 0;

// roll check
can_skip_check = true;
check_number = 7; //2-12
check_name = "Remove dick cheese";
player_interface_default_roll_scripts()
draw_dice_info = false;
draw_dice_roll = false;
roll_scale_modifier = 0.5; // size compared to backpack
roll_xoffset = 0; roll_yoffset = 0;
roll_xscale = 0; roll_yscale = 0;
roll_width = 0; roll_height = 0;
check_red = merge_colour(c_red, c_orange, 0.6);
check_green = merge_colour(c_lime, c_teal, 0.4);
dice_scale_modifier = 2;
dice_xoffset = 0; dice_yoffset = 0;
dice_xscale = 0; dice_yscale = 0;
dice_width = 0; dice_height = 0;
player_interface_set_draw_vars();

depth = -20;

// cursor management
cursor_hover = noone;
cursor_hold = noone;
cursor_xoffset = 0;
cursor_yoffset = 0;

// fsm
state_machine_init();

state_create("disabled", player_interface_disabled);
state_create("inventory", player_interface_inventory);
state_create("toDisabled", player_interface_to_disabled);
state_create("toInventory", player_interface_to_inventory);
state_create("toDiceCheck", player_interface_to_dice_check);
state_create("diceCheck", player_interface_dice_check);
state_create("diceCheckThrow", player_interface_dice_check_throw);
state_create("diceCheckFinish", player_interface_dice_check_finish);

state_init("disabled");
//state_init("disabled");
