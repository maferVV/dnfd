if! (!objGameManager.paused && isPlayerControlled) exit;

boat_readInputs();

var cam = objCamera;

if(action1_pressed)
{
    if( mouse_is_locked() )
        cursor_set(false, objCursor.crossair_subimg, 3, true);
    else
    {
        // lock and hide cursor
        cursor_set(true, objCursor.default_subimg, 1, false);
        cam.canControlMouse = true;
    }
}

// throw rope end into the mouse cursor
if( !mouse_is_locked() )
{
    var len = min(rope_length_max, point_distance(x, y, mouse_x, mouse_y));
    var dir = point_direction(x, y, mouse_x, mouse_y);
    var x2 = x + lengthdir_x(len, dir);
    var y2 = y + lengthdir_y(len, dir);
    var a = collision_line_point(x, y, x2, y2, objBuoy, true, true);
    
    rope_target = a[0];
    rope_end_x = a[1];
    rope_end_y = a[2];
    
    if(action2 && instance_exists(rope_target))
    {
        // Create rope
        
        var part_len = 10;
        var rope_new_len = point_distance(x, y, rope_end_x, rope_end_y);
        //rope_index = rope_create(x, y, dir, part_len, 1, rope_new_len/part_len, s_rope, 0.2, 0); //old
        var rope_id = rope_instance_create(x, y, dir, part_len, 1, rope_new_len/part_len, s_rope, 0.2, 0);
        with(rope_id){rope_join_start(rope_index, other.id);}
        with(rope_id){rope_join_end(rope_index, other.rope_target);}
    }
}
