/// find_path(x1, y1, x2, y2, id (who gets the callback))
/// Finds the path
{


	/*
	Is this path in the database?
	{
		Return path right away. 
	} else {
		queue pathfinding 
		return direction to walk 
	}

	*/


	if (argument0 >= 0 and 
		argument0 <= obj_pathfinding.h_cells and 
		argument2 >= 0 and 
		argument2 <= obj_pathfinding.h_cells and 
		argument1 >= 0 and 
		argument1 <= obj_pathfinding.v_cells and 
		argument3 >= 0 and 
		argument3 <= obj_pathfinding.v_cells) { // can this cell be selected 

		argument4.wasat_x = argument0
		argument4.wasat_y = argument1
		argument4.goto_x = argument2
		argument4.goto_y = argument3

		// check to see if its in the db
		var database_key = string(argument0)+"a"+string(argument1)+"b"+string(argument2)+"c"+string(argument3)

		//show_debug_message(database_key)

		if (ds_map_exists(obj_pathfinding_manager.pathfinding_database,database_key)) {
			// We've done this path before so return it 
			obj_pathfinding_manager.pf_debugging_cache_count++
	
			//show_debug_message("YES WE'VE DONE THIS BEFORE SO RELOAD IT ")
	
			find_path_send_callback(argument0,argument1,argument2,argument3,argument4)
	
			//return [1,obj_pathfinding_manager.pathfinding_database[? database_key]]
		} else {
	
			obj_pathfinding_manager.engine_on = true

			ds_queue_enqueue(obj_pathfinding_manager.pathfinding_queue_x1,argument0)
			ds_queue_enqueue(obj_pathfinding_manager.pathfinding_queue_y1,argument1)
			ds_queue_enqueue(obj_pathfinding_manager.pathfinding_queue_x2,argument2)
			ds_queue_enqueue(obj_pathfinding_manager.pathfinding_queue_y2,argument3)
			ds_queue_enqueue(obj_pathfinding_manager.pathfinding_id,argument4)
			//return [0,0]
		}

	} else {
		show_debug_message("PATHFINDING ERROR - point not in grid: x1"+string(argument0)+"y1"+string(argument1)+"x2"+string(argument2)+"y2"+string(argument3))	
	}


}

