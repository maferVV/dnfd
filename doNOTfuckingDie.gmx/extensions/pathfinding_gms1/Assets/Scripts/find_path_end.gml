/// find_path_end()
/// One off tasks to turn the found route into a path 
{

	// we found a route, now work backwards and turn it into a path 

	//show_debug_message("path finished")

	processing = false // We dont need to keep looking for a path, we found a route!

	path_clear_points(route)
	var finished_path = false
	var path_current_x = end_x
	var path_current_y = end_y

	path_add_point(route,end_x*cell_width,end_y*cell_height,100-terrain[# path_current_x,path_current_y])

	do {

		var lowest_around = ds_grid_get_min(fastest,path_current_x-1,path_current_y-1,path_current_x+1,path_current_y+1)

		h = ds_grid_value_x(fastest, path_current_x-1,path_current_y-1,path_current_x+1,path_current_y+1, lowest_around);
		v = ds_grid_value_y(fastest, path_current_x-1,path_current_y-1,path_current_x+1,path_current_y+1, lowest_around);
		

		//for (var h = path_current_x-1; h < path_current_x+1; ++h) {
		//	for (var v = path_current_y-1; v < path_current_y+1; ++v) {

				//if (fastest[# h,v] == lowest_around) {
					path_current_x = h
					path_current_y = v
				
					path_add_point(route,path_current_x*cell_width,path_current_y*cell_height,100-terrain[# path_current_x,path_current_y])
				
					if (h == start_x and v == start_y) {
						finished_path = true
						//path_add_point(route,start_x*cell_width,start_y*cell_height,100-terrain[# path_current_x,path_current_y])
					}

				//}
			//}
		//}

	


	} until (finished_path);
	path_reverse(route)

	obj_pathfinding_manager.pf_debugging_find_count++

	find_path_cache()
	find_path_send_callback(start_x,start_y,end_x,end_y,object_id)
}

