/// create_panel_input(name, rel_x, rel_y, width, height, value, input)
{
    var name,rel_x,rel_y,width,height,value,input,player;
    name = argument[0];
    rel_x = argument[1];
    rel_y = argument[2];
    width = argument[3];
    height = argument[4];
    value = argument[5];
    input = argument[6];
    
    player = global.editPlayerSlot;
    
    // create label in first half of panel
    with(instance_create(x, y, obj_ui_label))
    {
        set_sprite_size(width/2, height); 
        // build fl
        f = fl_add_label(name+"_label_"+string(player), 0, 0, sprite_width, sprite_height, value);
    }
    
    // keyboard input button
    with(instance_create(x+width/2, y, obj_ui_input_button))
    {
        set_sprite_size((width/2)/2, height); 
        // build fl
        f = fl_add_input_button(name+"_key_button_"+string(player), 0, 0, sprite_width, sprite_height, input, false);
    }
    
    // gamepad input button
    with(instance_create(x+width/2 + (width/2)/2, y, obj_ui_input_button))
    {
        set_sprite_size((width/2)/2, height);
        // build fl
        f = fl_add_input_button(name+"_gamepad_button_"+string(player), 0, 0, sprite_width, sprite_height, input, true);
    }
}
