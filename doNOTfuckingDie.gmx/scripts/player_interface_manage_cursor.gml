/// player_interface_manage_cursor()
if( instance_exists(cursor) )
{
    var click = mouse_check_button_pressed(mb_left);
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
    if( !instance_exists(cursor_hold) && instance_exists(cursor_hover) && click )
    {
        cursor_hold = cursor_hover;
        cursor_xoffset = cursor_hold.x-cursor.GUIx;
        cursor_yoffset = cursor.GUIy-cursor_hold.y;
    }
    
    // Drag item
    if( instance_exists(cursor_hold) )
    {
        cursor_hold.x = cursor.GUIx + cursor_xoffset;
        cursor_hold.y = cursor.GUIy - cursor_yoffset;
        
        // Drop Item
        if(mouse_check_button_released(mb_left))
            cursor_hold = noone;
    }
    
    // Double click item
    if(click)
    {
        if(waiting_for_doubleclick)
        {
            // double clicked is true here.
            if(instance_exists(cursor_hover))
            {
                player.equiped = cursor_hover.inventory_item;
                inventory_item_equiped = cursor_hover.id;
                audio_play_sound(sndInterface1, 1, false);
            }
            waiting_for_doubleclick = false;
        }
        else
        {
            waiting_for_doubleclick = true;
            alarm[0] = 30;
        }
    }
}
