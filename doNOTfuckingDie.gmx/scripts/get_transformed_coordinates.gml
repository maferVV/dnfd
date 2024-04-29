/// get_transformed_coordinates(x1, y1, x2, y2, angle, resize)
// "throws" a line from (x1,y1) to (x2,y2), and then modifies it by angle and resize.
// returns an array (x,y)
{
    var x1, y1, x2, y2, _angle, _resize, _len, _dir, newX, newY;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    _angle = argument4;
    _resize = argument5;
    
    _len = point_distance(x1, y1, x2, y2)*_resize;
    _dir = point_direction(x1, y1, x2, y2)+_angle;
    newX = x1 + lengthdir_x(_len, _dir);
    newY = y1 + lengthdir_y(_len, _dir);
    
    return array(newX, newY);
}
