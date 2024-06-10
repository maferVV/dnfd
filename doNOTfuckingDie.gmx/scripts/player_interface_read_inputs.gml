/// player_interface_read_inputs()
if(!objGameManager.paused) 
{
    inventory_pressed = inputdog_pressed("inventory", playerSlot);
    interact_pressed = inputdog_pressed("interact", playerSlot);
    pause_pressed = inputdog_pressed("pause", playerSlot);
}
