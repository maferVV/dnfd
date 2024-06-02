/// player_interface_manage_cursor()
if( instance_exists(cursor) )
{
    
    var nearest_list = instance_nearest_list(cursor.GUIx, cursor.GUIy, objPlayerInterfaceItem);
    var col_list = collision_point_list(cursor.GUIx, cursor.GUIy, objPlayerInterfaceItem, 1, 1);
    var nearest = nearest_list[| 0];
    cursor_hover = noone;
    
    // Assign cursor_hover
    if( col_list != noone )
    {
        var i = ds_list_find_index(col_list, nearest);
        if(i != -1)
        {
            var ins = col_list[| i];
            cursor_hover = ins;
        }
        ds_list_destroy(col_list);
    }
    ds_list_destroy(nearest_list);
    
    // Hold an item
    if( (cursor_hold==noone) && (cursor_hover!=noone) && mouse_check_button_pressed(mb_left) )
    {
        cursor_hold = cursor_hover;
        cursor_xoffset = cursor_hold.x-cursor.GUIx;
        cursor_yoffset = cursor.GUIy-cursor_hold.y;
    }
    
    // Drag item
    if( (cursor_hold!=noone) )
    {
        cursor_hold.x = cursor.GUIx + cursor_xoffset;
        cursor_hold.y = cursor.GUIy - cursor_yoffset;
        
        // Drop Item
        if(mouse_check_button_released(mb_left))
            cursor_hold = noone;
    }
}
