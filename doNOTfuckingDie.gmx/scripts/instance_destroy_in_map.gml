/// instance_destroy_in_map(map id)
{
    var map = argument0;
    
    for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
    {
      var v = map[? k];
      /* Use k, v here */
      if(instance_exists(v)) instance_destroy(v);
    }
}
