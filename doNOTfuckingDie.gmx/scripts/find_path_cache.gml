/// find_path_cache()
/// I will store the path in obj_pathfinding 
{
    var newpath = path_duplicate(obj_pathfinding.route)
    //show_debug_message("Just cached: "+string(start_x)+"a"+string(start_y)+"b"+string(end_x)+"c"+string(end_y)+"   pathid:"+string(newpath))
    obj_pathfinding_manager.pathfinding_database[? string(start_x)+"a"+string(start_y)+"b"+string(end_x)+"c"+string(end_y)] = newpath;
}

