/// tile_get_bitmask_8(tile)
/// Gets the tile neighbors of a given tile and returns
/// a unique tile number 0-15.
///
/// Assumes the neighboring tiles must be of the
/// same background and left, top properties
///
/// Returns a number 0-15
/// -1-
/// 2-4
/// -8-
{
    var _tile, _depth, _back, _left, _top, _x, _y, _w, _h, _bit, _other;
    _tile = argument0;
    _depth = tile_get_depth(_tile);
    _back = tile_get_background(_tile);
    _left = tile_get_left(_tile);
    _top = tile_get_top(_tile);
    _x = tile_get_x(_tile);
    _y = tile_get_y(_tile);
    _w = tile_get_width(_tile);
    _h = tile_get_height(_tile);
    _bit = 0;
    
    // north 1
    _other = tile_layer_find(_depth, _x, _y-_h);
    if( (_other!=-1)&&
        (tile_get_background(_other) == _back)&&
        (tile_get_left(_other) == _left)&&
        (tile_get_top(_other) == _top) )
        _bit+=1;
        
    // west 2
    _other = tile_layer_find(_depth, _x-_w, _y);
    if( (_other!=-1)&&
        (tile_get_background(_other) == _back)&&
        (tile_get_left(_other) == _left)&&
        (tile_get_top(_other) == _top) )
        _bit+=2;
        
    // east 4
    _other = tile_layer_find(_depth, _x+_w, _y);
    if( (_other!=-1)&&
        (tile_get_background(_other) == _back)&&
        (tile_get_left(_other) == _left)&&
        (tile_get_top(_other) == _top) )
        _bit+=4;
        
    // south 1
    _other = tile_layer_find(_depth, _x, _y+_h);
    if( (_other!=-1)&&
        (tile_get_background(_other) == _back)&&
        (tile_get_left(_other) == _left)&&
        (tile_get_top(_other) == _top) )
        _bit+=8;
        
    return _bit;
}
