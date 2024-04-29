/// ds_grid_to_string(id)
var g = argument0;
var s = "";

s += "grid:" +string(g) + ":#";
for(var yy = 0; yy < ds_grid_height(g); yy++)
{
    for(var xx = 0; xx < ds_grid_width(g); xx++)
    {
        s += "["+ tmc_string_pad_left(string(g[# xx, yy]),3," ") +"]";
    }
    s += "#";
}
return s;
