/// process inputs if under control
if(!objGameManager.paused && isPlayerControlled) 
{
    input_direction = inputdog_direction("up","down","left","right",playerSlot);
    jump_down = inputdog_down("jump", playerSlot);
    jump_pressed = inputdog_pressed("jump", playerSlot);
    jump_released = inputdog_released("jump", playerSlot);
    
    action1 = inputdog_released("action1", playerSlot);
}
/*else
    luz_defaultInputs();
