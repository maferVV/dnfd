/// tileset_create(depth, back, left, top, object)
/// Auto-tiles a layout from only the tiles in a specific
/// layer, background, and preset from background.
///
/// The modified tiles are switched with a given object
/// and the image index is auto-given.
{
    var _depth, _back, _left, _top, _obj, _tiles, _tile;
    _depth = argument0;
    _back = argument1;
    _left = argument2;
    _top = argument3;
    _obj = argument4;
    
    _tiles = tile_get_ids_at_depth(_depth);
    for(var i = 0; i < array_length_1d(_tiles); i++)
    {
        _tile = _tiles[i];
        
        if( (tile_get_background(_tile) == _back)&&
            (tile_get_left(_tile) == _left)&&
            (tile_get_top(_tile) == _top) )
        {
            var o = instance_create(tile_get_x(_tile), tile_get_y(_tile), _obj);
            o.image_index = tile_get_bitmask_8(_tile);
            print_vars("o.image_index", o.image_index);
        }
        
        // finally, set tile invisible
        tile_set_visible(_tile, false);
    }
}
