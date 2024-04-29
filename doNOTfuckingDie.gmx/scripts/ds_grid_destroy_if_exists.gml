/// ds_grid_destroy_if_exists(id)
var grid = argument0;

if( ds_exists(grid, ds_type_grid) )
    ds_grid_destroy(grid);
// else return error("Not a grid: " + string(grid), false);
    
return true
