/// element_is_in_array(n, array_id)
/// returns true if n is in array_id
{
    var _n, _array_id;
    _n = argument0;
    _array_id = argument1;
    for(var i = 0; i < array_length_1d(_array_id); i++)
    {
        if( _n == _array_id[i] )
            return true;
    }
    return false;
}
