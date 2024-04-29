/// so_whitelist(so, id)
/// Adds id to the whitelist of objects NOT to affect
{
    var _so, _id;
    _so = argument0;
    _id = argument1;
    with(_so)
    {
        whitelist[array_length_1d(whitelist)] = _id;
    }
}
