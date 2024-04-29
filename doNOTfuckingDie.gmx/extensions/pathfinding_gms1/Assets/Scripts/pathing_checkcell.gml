/// pathing_checkcell(x, y, PF_DIAGONALMULTIPLIER)
/// Find the weight of this cell
{

	gml_pragma("forceinline");


	var cell_x = clamp(argument0,0,h_cells-1)
	var cell_y = clamp(argument1,0,v_cells-1)


	if (checked[# cell_x,cell_y] == PF_LARGESTNUMBER-1) {
		return PF_LARGESTNUMBER;
	}


	var lowest_around = ds_grid_get_min(checked,
										clamp(cell_x-1,0,h_cells-1),
										clamp(cell_y-1,0,v_cells-1),
										clamp(cell_x+1,0,h_cells-1),
										clamp(cell_y+1,0,v_cells-1))
									
							
	var new_value = lowest_around+terrain[# cell_x,cell_y]*argument2


	if (new_value > fastest[# cell_x,cell_y]) { // this one isnt better
		return PF_LARGESTNUMBER;
	} else {
	
		if (fastest[# cell_x,cell_y] == PF_LARGESTNUMBER) {
			ds_priority_add(pf_queue_x,cell_x,lowest_around)
			ds_priority_add(pf_queue_y,cell_y,lowest_around)
		}
	
		checked[# cell_x,cell_y] = new_value // dont want to go back to this one
		fastest[# cell_x,cell_y] = new_value

		return new_value
	}


}

