/// chunk_key_is_in_grid(keystr, grid_id)
{
    var k, grid, list, xx, yy;
    k = argument0;
    grid = argument1;
    
    // get xx, yy
    list = string_parse(k, ",", false);
    xx = real(ds_list_find_value(list,0));
    yy = real(ds_list_find_value(list,1));
    ds_list_destroy(list);
    
    for(var i = 0; i < ds_grid_height(grid); i++)
    {
        if( (ds_grid_get(grid, 0, i)==xx) && (ds_grid_get(grid, 1, i)==yy) )
            return true;
    }
    return false;
}
