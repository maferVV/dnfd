/// drag_and_drop([button?])
//
//  Enables the object to be drag and dropped with the mouse around the room.
//
//      button?         Optional. Can be enabled if the sprite works as a button.
//                      ie. contains 2 images of a button being pressed.
//
/// GMLscripts.com/license
{
    var xx, yy, isbutton, hold, pressed, released;
    // Implement global vars
    if !variable_global_exists("cursor_dnd")
    {
        global.cursor_hover = noone;
        global.cursor_dnd = noone;
        global.cursor_xoffset = 0;
        global.cursor_yoffset = 0;
    }
    
    // variables
    xx = mouse_x;
    yy = mouse_y;
    isbutton = false;
    if(argument_count>0) isbutton = argument[0];
    if isbutton image_speed = 0;
    
    // inputs
    hold = mouse_check_button(mb_left);
    pressed = mouse_check_button_pressed(mb_left);
    released = mouse_check_button_released(mb_left);
    
    // mark as hover instance
    if position_meeting(xx, yy, id) && !instance_exists(global.cursor_hover)
    {
        global.cursor_hover = id;
    }
    if(global.cursor_hover == id)
    {
        if(!position_meeting(xx, yy, id))
            global.cursor_hover = noone;
    }
    
    // detect click
    if position_meeting(xx, yy, id) && pressed && !instance_exists(global.cursor_dnd)
    {
        global.cursor_dnd = id;
        global.cursor_xoffset = x-xx;
        global.cursor_yoffset = yy-y;
    }
    // dragging
    if(global.cursor_dnd == id)
    {
        x = xx+global.cursor_xoffset;
        y = yy-global.cursor_yoffset;
        if isbutton image_index = 1;
        if released
        {
            global.cursor_dnd = noone;
            if isbutton image_index = 0;
        }
    }
}
