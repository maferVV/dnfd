/// ds_map_to_inline_string(id)
var map, s;
map = argument0;
s = "";
if( ds_exists(map, ds_type_map) )
{
    s += "{"+string(map)+"}";
    for(var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
    {
        var v = map[? k];
        /* Use k, v here */
        s += "["+string(k)+"; "+ string(v) +"]";
    }
}
else
    s += "ds map does not exist.";
return s;
