/// player_interface_draw_gui()

var guiw = display_get_gui_width();
var guih = display_get_gui_height();

if(state_name == "inventory")
{
    draw_set(fg_alpha, fg_color);
    draw_rectangle(-32, -32, guiw+32, guih+32, false);
    var xx = guiw/2;
    var yy = guih/2;
    var inventory_empty = true;
    var str = "Items:";
    for(var k = ds_map_find_first(inventory); !is_undefined(k); k = ds_map_find_next(inventory, k))
    {
        var inventory_item = inventory[? k];
        var amount = inventory_item[? "amount"];
        var sprite = item_name_to_sprite(k);
        
        if(amount>0)
        {
            inventory_empty = false;
            str += "#"+"    - "+string(k)+" ("+string(amount)+")";
        }
    }
    if(inventory_empty) str = "lmao u have no items you broke ass";    
    draw_set(1, c_white, fnt_rubik, fa_center, fa_middle);
    draw_text_outlined(xx, yy, str, c_white, c_black);
}
draw_set();


