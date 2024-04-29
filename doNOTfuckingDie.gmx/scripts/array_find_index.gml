/// array_find_index(array_id, value)
/// returns -1 if none
{
    var _array_id, _value;
    _array_id = argument0;
    _value = argument1;
    
    for(var i = 0; i < array_length_1d(_array_id); i++)
    {
        if( _array_id[i] == _value )
            return i;
    }
    return -1;
}
