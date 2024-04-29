/// process inputs if under control
if(!objGameManager.paused && isPlayerControlled) 
{
    input_direction = inputdog_direction("up","down","left","right",playerSlot);
    jump_down = inputdog_down("jump", playerSlot);
    jump_pressed = inputdog_pressed("jump", playerSlot);
    jump_released = inputdog_released("jump", playerSlot);
    
    action1_down = inputdog_down("action1", playerSlot);
    action1_pressed = inputdog_pressed("action1", playerSlot);
    action1_released = inputdog_released("action1", playerSlot);
    
    action2_down = inputdog_down("action2", playerSlot);
    action2_pressed = inputdog_pressed("action2", playerSlot);
    action2_released = inputdog_released("action2", playerSlot);
}
else
    boat_defaultInputs();
