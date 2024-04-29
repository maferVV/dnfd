/// ssp_readInputs()

dir_down = inputdog_down("right", playerSlot) - inputdog_down("left", playerSlot);
jump_down = inputdog_down("up", playerSlot);
jump_pressed = inputdog_pressed("up", playerSlot);
jump_released = inputdog_released("up", playerSlot);
attack_down = inputdog_down("attack", playerSlot);
attack_pressed = inputdog_pressed("attack", playerSlot);
attack_released = inputdog_released("attack", playerSlot);
