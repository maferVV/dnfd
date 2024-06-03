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

backpack_xoffset = 0;
backpack_yoffset = 0;
backpack_yoffset_disabled = 0;
backpack_yoffset_enabled = 0;
backpack_xscale_bounce = 0;
backpack_yscale_bounce = 0;



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

state_init("disabled");
