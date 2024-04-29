/// find_path_start()
/// One off tasks that we need to do before finding the path
{


	//show_debug_message("Starting to find path")

	processing = true // are we still looking for a path?

	ds_grid_clear(fastest,PF_LARGESTNUMBER)
	fastest[# start_x,start_y] = 1
	ds_grid_clear(checked,PF_LARGESTNUMBER)
	checked[# start_x,start_y] = 1


	finished_spreadout = false

	pf_debug_frames_to_calculate_last_path = 0

	ds_priority_clear(pf_queue_x)
	ds_priority_clear(pf_queue_y)

	ds_priority_add(pf_queue_x,start_x,0)
	ds_priority_add(pf_queue_y,start_y,0)


}

