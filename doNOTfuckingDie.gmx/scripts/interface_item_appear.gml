/// interface_item_appear(_player_interface, _index, _inventory_item)
{
    var _player_interface = argument0;
    var _index = argument1;
    var _inventory_item = argument2;
    player_interface = _player_interface;
    index = _index;
    inventory_item = _inventory_item;
    
    sprite_index = item_name_to_sprite(inventory_item[? "string"]);
    depth_offset = player_interface.depth - 1000;
    set_scale(player_interface.image_xscale);
}
