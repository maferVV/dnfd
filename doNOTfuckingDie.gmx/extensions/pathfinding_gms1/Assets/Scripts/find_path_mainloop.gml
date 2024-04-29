/// find_path_mainloop()
/// Loop around this until path has been found or number of checks 
{

pf_debug_frames_to_calculate_last_path ++ // count how many frames this took 
loopcount = 0

pf_timer_start = get_timer()

do {

loopcount++

//lowest_value = ds_grid_get_min(checked,constrain_grid_x1,constrain_grid_y1,constrain_grid_x2,constrain_grid_y2)

//var h = ds_grid_value_x(checked, constrain_grid_x1, constrain_grid_y1, constrain_grid_x2, constrain_grid_y2, lowest_value);
//var v = ds_grid_value_y(checked, constrain_grid_x1, constrain_grid_y1, constrain_grid_x2, constrain_grid_y2, lowest_value);

//lowest_value = ds_priority_find_priority(pf_queue_x, ds_priority_find_min(pf_queue_x))

var h = ds_priority_delete_min(pf_queue_x)
var v = ds_priority_delete_min(pf_queue_y)

h = clamp(h,0,h_cells)
v = clamp(v,0,v_cells)

//show_debug_message("x:+"+string(h)+" y:"+string(v))

//for (var h = constrain_grid_x1; h < constrain_grid_x2; ++h) {
//for (var v = constrain_grid_y1; v < constrain_grid_y2; ++v) {


//show_debug_message("x:"+string(h)+"y:"+string(v))

//if (checked[# h,v] <= lowest_value) {

// check to see if we are home
if (h <= end_x+1 and h >= end_x-1 and v <= end_y+1 and v >= end_y-1) {
finished_spreadout = true
} else {

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

// update the area we are checking 
/*
if (h-2 < constrain_grid_x1 and h-2 >=2) {constrain_grid_x1 = h-2;}
if (v-2 < constrain_grid_y1 and v-2 >=2) {constrain_grid_y1 = v-2;}
if (h+2 > constrain_grid_x2 and h+2 <=h_cells) {constrain_grid_x2 = h+2;}
if (v+2 > constrain_grid_y2 and v+2 <=h_cells) {constrain_grid_y2 = v+2;}
*/

//}

//}
//}
//show_debug_message("timer" + string(get_timer()-pf_timer_start) + " count: " + string(loopcount) + " PF_CPU_TIME: " + string(PF_CPU_TIME))
//} until (finished_spreadout or loopcount>CHECKSPERFRAME); // if you want a fixed number of checks each frame
} until (finished_spreadout or get_timer() - pf_timer_start > pf_get_cpu_time()); // if you want cpu timing each frame

pf_timer_end = get_timer() - pf_timer_start;
pf_debug_loop_count = loopcount

if (finished_spreadout = true) {
finished_spreadout = false
find_path_end() // turn the spreadout into a path
}


}

