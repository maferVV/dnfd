/// find_path_mainloop()
/// Loop around this until path has been found or number of checks 
{
    pf_debug_frames_to_calculate_last_path ++ // count how many frames this took 
    loopcount = 0
    pf_timer_start = get_timer()
    do
    {
        loopcount++
        var h = ds_priority_delete_min(pf_queue_x)
        var v = ds_priority_delete_min(pf_queue_y)
        h = clamp(h,0,h_cells)
        v = clamp(v,0,v_cells)
        //show_debug_message("x:+"+string(h)+" y:"+string(v))
        // check to see if we are home
        if (h <= end_x+1 and h >= end_x-1 and v <= end_y+1 and v >= end_y-1)
        {
            finished_spreadout = true
        }
        else
        {
            pathing_checkcell(h+1,v+0,1)
            pathing_checkcell(h+0,v+1,1)
            pathing_checkcell(h-1,v+0,1)
            pathing_checkcell(h+0,v-1,1)
            
            pathing_checkcell(h+1,v+1,PF_DIAGONALMULTIPLIER)
            pathing_checkcell(h+1,v-1,PF_DIAGONALMULTIPLIER)
            pathing_checkcell(h-1,v+1,PF_DIAGONALMULTIPLIER)
            pathing_checkcell(h-1,v-1,PF_DIAGONALMULTIPLIER)
        }
        checked[# h,v] = PF_LARGESTNUMBER-1 // dont want to go back to this one
    } until (finished_spreadout or get_timer() - pf_timer_start > pf_get_cpu_time()); // if you want cpu timing each frame
    
    pf_timer_end = get_timer() - pf_timer_start;
    pf_debug_loop_count = loopcount
    
    if (finished_spreadout = true)
    {
        finished_spreadout = false
        find_path_end() // turn the spreadout into a path
    }
}
