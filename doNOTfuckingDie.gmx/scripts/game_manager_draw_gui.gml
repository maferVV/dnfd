///

/// draw print message
if(display_print)
{
    print_msg_alpha = approach(print_msg_alpha, 0, 0.009);
    draw_set(print_msg_alpha, c_white, fnt_mono, fa_left, fa_bottom);
    draw_text_outlined(5, display_get_gui_height()-5, print_msg, c_black, c_white);
    draw_set();
    print_msg_prev = print_msg;
}

/// draw quitting... message
if(pressed_to_quit)
{
    
    draw_circle_colour(5+32, 5+32, 32, c_black, merge_colour(c_black, c_dkgray, 0.25), false);
    draw_pie_easy(5+32+1, 5+32+1, quit_timer, time_to_quit-5, c_white, 30, 1);
    draw_set(1, c_white, fnt_rubik);
    draw_text_outlined(5+32*2.1, 5, nat("Closing..."), c_white, c_black);
    draw_set();
}
