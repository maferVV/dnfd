/// player_interface_create()

// references
player = noone;
inventory = noone;

// vars
playerSlot = 1;
fg_alpha = 0;
fg_color = c_white;
inventory_pressed = false;

// fsm
state_machine_init();

state_create("disabled", player_interface_disabled);
state_create("inventory", player_interface_inventory);

state_init("disabled");
