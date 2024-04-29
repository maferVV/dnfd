/// create_panel_horSlider(name,rel_x,rel_y,width,height,value,indicator_value,min_val,max_val,interval)
// sepparated in 2 parts: label and tabs
// GROUP name is the name to distinguish between tab groups
// LABEL value is what is shown in the label section
{
    var name,rel_x,rel_y,width,height,value,indicator_value,min_val,max_val,interval;
    name = argument[0];
    rel_x = argument[1];
    rel_y = argument[2];
    width = argument[3];
    height = argument[4];
    value = argument[5];
    indicator_value = argument[6];
    min_val = argument[7];
    max_val = argument[8];
    interval = argument[9];
    
    
    ///create label in first half of panel
    with(instance_create(x, y, obj_ui_label))
    {
        set_sprite_size(width/2,height); 
        // build fl
        f = fl_add_label(name+"_label", 0, 0, sprite_width, sprite_height, value);
    }
    
    // percentage indicator_value
    var part = 0.1;
    with(instance_create(x+(width/2), y, obj_ui_label))
    {
        set_sprite_size(width*part,height); 
        // build fl
        f = fl_add_label(name+"_indicator", 0, 0, sprite_width, sprite_height, string(indicator_value) );
    }
    
    // horSlider
    with(instance_create(x+(width/2)+(width*part), y, obj_ui_slider_hor))
    {
        set_sprite_size(width*(1-part),height); 
        // build fl
        f = fl_add_slider(name+"_slider", 0, 0, sprite_width, sprite_height, min_val, max_val, interval, false);
        fl_slider_add_knob(f,indicator_value,sprite_get_width(spr_ui_slider_knob)*2,sprite_height);
    }
}
