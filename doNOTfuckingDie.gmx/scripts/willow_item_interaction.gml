/// willow_item_interaction()


var item = collision_circle(x, decimal_bbox_bottom(), item_pickup_radius, objOverworldItem, true, true);
if( instance_exists(item) && !collision_line(x, decimal_bbox_bottom(), item.x, item.y, collision_object, true, true) )
{
    var temp = inputdog_find_inputmanager_child_by_player(1);
    var key = inputdog_get_keyboard_string(ds_map_find_value(temp.customKeys,"interact"));
    with(item)
    {
        if(other.interact_pressed)
        {
            item_pick_up(other.id);
        }
    }
}
