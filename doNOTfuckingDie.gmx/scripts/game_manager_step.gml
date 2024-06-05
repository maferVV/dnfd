///

/// Pause pressed

var pauseInput = inputdog_pressed("pause") && canPause;

if(pauseInput)
{
    switch(room)
    {
        default:
        case rmMenu:
            if( !is_browser() ) game_end_friendly();
            break;
        case play_room:
            toggle_pause();
            break;
    }
}

///

/// hold to quit

var dt = global.tmc_dt_delta_t;

if pressed_to_quit
{
    quit_timer += 1 * dt*room_speed;
    if(inputdog_released("pause"))
    {
        // cancelled!
        pressed_to_quit = false;
        quit_timer = 0;
    }
    if(quit_timer >= time_to_quit)
    {
        game_end();
    }
}


