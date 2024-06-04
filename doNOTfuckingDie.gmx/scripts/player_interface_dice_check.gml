if(state_new)
{
    draw_roll_check = true;
    
}

roll_number = round(animate_wave(2, 12, 15));
print_vars("roll_number", roll_number);



player_interface_manage_cursor();
player_interface_snapback_scale();
