/// create_panel_buttons(GROUP_name,rel_x,rel_y,width,height,LABEL_value,[tab1_name],[tab1_value],[tab1_active],[tab2_name],[tab2_value],[tab2_active],[tab3_name],[tab3_value],[tab3_active])
//                            0         1    2    3      4         5           6           7            8             9           10           11            12          13           14
// Like create_panel_tabGroup, but with independent and real buttons
{
    var name,rel_x,rel_y,width,height,value;
    name = argument[0];
    rel_x = argument[1];
    rel_y = argument[2];
    width = argument[3];
    height = argument[4];
    value = argument[5];
    
    
    ///create label in first half of panel
    with(instance_create(x, y, obj_ui_label))
    {
        set_sprite_size(width/2,height); 
        // build fl
        f = fl_add_label(name+"_label", 0, 0, sprite_width, sprite_height, value);
    }
    
    // create tabs in second half, equal size
    var tab_count = floor((argument_count-6)/3);
    var tab_width = (width/2) / tab_count;
    var tab_height = height;
    var tab_offset = tab_height*0.25;
    for(var i = 6; i < argument_count; i+=3)
    {
        var tab_index = floor((i-6)/3);
        var tab_name = argument[i];
        var tab_value = argument[i+1];
        var tab_active = argument[i+2];
        var xx = x + (width/2) + (tab_index*tab_width);
        var yy = y;
        // create tabs
        with(instance_create(xx, yy, obj_ui_button))
        {
            // change dimensions on both component and fl
            set_sprite_size(tab_width,tab_height /*- tab_offset*/); 
            // build fl
            f = fl_add_button(tab_name, 0, 0, sprite_width, sprite_height, tab_value);
        }
    }
}
