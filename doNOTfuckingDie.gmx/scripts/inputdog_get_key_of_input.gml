/// inputdog_get_key_of_input( playerslot, input_name )
{
    var temp = inputdog_find_inputmanager_child_by_player( argument0 );
    return inputdog_get_keyboard_string(ds_map_find_value(temp.customKeys,argument1));
}

