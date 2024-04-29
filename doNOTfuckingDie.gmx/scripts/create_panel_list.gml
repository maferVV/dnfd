/// create_panel_list(name, rel_x, rel_y, width, height, value_LABEL, selected_option, element0, element1, ...)
{
    var name,rel_x,rel_y,width,height,value,selected_option;
    name = argument[0];
    rel_x = argument[1];
    rel_y = argument[2];
    width = argument[3];
    height = argument[4];
    value = argument[5];
    selected_option = argument[6];
    
    
    // create label in first half of panel
    with(instance_create(x, y, obj_ui_label))
    {
        set_sprite_size(width/2, height); 
        // build fl
        f = fl_add_label(name+"_label", 0, 0, sprite_width, sprite_height, value);
    }
    
    //button 1
    with(instance_create(x+(width/2), y, obj_ui_button2))
    {
        set_sprite_size(height, height);
        f = fl_add_button(name+"_left",0,0,sprite_width,sprite_height,"");
        icon = 0;
    }
    // list
    with(instance_create(x+(width/2)+height, y, obj_ui_list))
    {
        set_sprite_size(width/2 - height*2, height);
        for(var i = 7; i < argument_count; i++)
        {
            ds_list_add(options, argument[i]);
        }
        f = fl_add_list(name+"_list",0,0,sprite_width,sprite_height,options,selected_option);
    }
    //button 2
    with(instance_create(x+width-height, y, obj_ui_button2))
    {
        set_sprite_size(height, height);
        f = fl_add_button(name+"_right",0,0,sprite_width,sprite_height,"");
        icon = 1;
    }
}
