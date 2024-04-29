/// ds_lists_destroy_in_map(id)
// destroys all lists inside given map
{
    var map = argument0;
    for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
    {
        var v = map[? k];
        /* Use k, v here */
        if( ds_exists(v, ds_type_list) )
        {
            ds_list_destroy(v);
        }
    }
}
