/// ds_map_to_string(id, [lpad=3])
var map, lpad, s;
map = argument[0];
lpad = 3; if(argument_count > 1) lpad = argument[1];
s = "";

if( ds_exists(map, ds_type_map) )
{
    s += "ds_map no."+string(map)+" of size "+string(ds_map_size(map))+":#";
    for(var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
    {
        var v = map[? k];
        /* Use k, v here */
        var vs = string(v);
        if(ds_exists(v,ds_type_map)) vs = ds_map_to_inline_string(v);
        s += "["+string_lpad(string(k),lpad,"0")+"] "+ vs +"#";
    }
    s += "ds_map ends."+"#"
}
else
    s += "ds map does not exist."+"#";
return s;
