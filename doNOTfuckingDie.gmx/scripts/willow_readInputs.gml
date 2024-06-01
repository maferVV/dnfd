/// process inputs if under control
if(!objGameManager.paused && isPlayerControlled) 
{
    input_direction = inputdog_direction("up","down","left","right",playerSlot);
    
    
    action1_released = inputdog_released("action1", playerSlot);
}
/*else
    luz_defaultInputs();
