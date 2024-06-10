/// set_depth( [level = -bbox_bottom] )
{
    var level = -decimal_bbox_bottom(); if(argument_count > 0) level = argument[0];
    depth = level;
}
