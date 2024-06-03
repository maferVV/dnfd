/// interface_item_put_away()
// Put away item in backpack, so save my state and delete instance
{
    inventory_item[? "x"] = x-player_interface.backpack_xoffset;
    inventory_item[? "y"] = y-player_interface.backpack_yoffset;
    instance_destroy();
}
