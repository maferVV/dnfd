/// find_path_clear_db()
/// Removes everything from the database
{
    var size = ds_map_size(obj_pathfinding_manager.pathfinding_database) ;
    var key = ds_map_find_first(obj_pathfinding_manager.pathfinding_database);
    for (var i = 0; i < size; i++;)
    {
        if (path_exists(obj_pathfinding_manager.pathfinding_database[? key]))
        {
            path_delete(obj_pathfinding_manager.pathfinding_database[? key])
        }
        key = ds_map_find_next(obj_pathfinding_manager.pathfinding_database, key);
    }
    ds_map_clear(obj_pathfinding_manager.pathfinding_database)
}

