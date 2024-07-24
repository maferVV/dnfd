/// player_interface_draw_inventory_info

var xx = guiw/2 + guiw*0.2;
var yy = guih/2 - guih*0.05;

str = "";
for(var i = 0; i < ds_list_size(inventory); i++)
{
    str += string_lpad(string(i),2,"0")+":" +string(ds_map_to_inline_string(inventory[| i]) );
    str += "#";
}
draw_text_outlined(xx, yy, str, c_white, c_black)
print(str);
