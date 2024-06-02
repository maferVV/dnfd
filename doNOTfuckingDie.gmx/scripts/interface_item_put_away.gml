/// interface_item_put_away()
{
    inventory_item[? "x"] = x-player_interface.backpack_xoffset;
    inventory_item[? "y"] = y-player_interface.backpack_yoffset;
    instance_destroy();
}
