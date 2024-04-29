switch(state)
{
    case bat_attack:
        state_switch(bat_idle);
        dt_image_index = image_number-1;
        dt_image_speed = 0;
        break;
}
