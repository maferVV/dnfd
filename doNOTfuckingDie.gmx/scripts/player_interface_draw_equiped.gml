/// player_interface_draw_equiped()

if( (state_name == "inventory")&&(state_timer > 5) )
{
    if(instance_exists(inventory_item_equiped))
    {
        draw_set(1, c_white, fnt_rubik, fa_center, fa_middle);
        draw_text_shadow(equiped_x, inventory_item_equiped.y, "Equiped", c_white, c_black, 1);
        var tx = equiped_x - guih*0.1;
        draw_set(1, c_black);
        var lo = 2;
        draw_line_dotted_width(tx+lo,
                            inventory_item_equiped.y+lo,
                            inventory_item_equiped.x+lo,
                            inventory_item_equiped.y+lo,
                            guih*0.01,
                            0.06);
        draw_set(1, c_white);
        draw_line_dotted_width(tx,
                            inventory_item_equiped.y,
                            inventory_item_equiped.x,
                            inventory_item_equiped.y,
                            guih*0.01,
                            0.06);
        draw_circle(tx,
                    inventory_item_equiped.y,
                    guih*0.015,
                    false);
        draw_set();
        
        
    }
    else
    {
        draw_set(1, c_white, fnt_rubik, fa_center, fa_middle);
        draw_text_shadow(equiped_x, equiped_y, "No item equiped#(Double click on an item to equip it)", c_white, c_black, 1);
        draw_set();
    }
}
