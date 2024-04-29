if (!ds_exists(global.natlangmap, ds_type_map)) return error("No .nat loaded", "")
var val = global.natlangmap[? argument0];
if(val == undefined)
{
    return argument0;
    //return error("No translation for '"+argument0+"'!", argument0);
}
return val;

