/// chunk_in_range(xx, yy)
// returns true if inside map circle
{
    var xx, yy;
    xx = argument0;
    yy = argument1;
    // transform chunk coords back to world coords
    xx = xx*chunk_width;
    yy = yy*chunk_height;
    var twm = objWorldManager;
    return point_in_ellipse(xx, yy,
                        (twm.bounds_x1+twm.bounds_x2)/2,
                        (twm.bounds_y1+twm.bounds_y2)/2,
                        abs(twm.bounds_x1-twm.bounds_x2)/2,
                        abs(twm.bounds_y1-twm.bounds_y2)/2 );
}
