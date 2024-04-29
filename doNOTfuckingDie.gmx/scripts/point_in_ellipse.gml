/// point_in_ellipse(xx, yy, center_x, center_y, radius_x, radius_y)
{
    var xx = argument0;
    var yy = argument1;
    var center_x = argument2;
    var center_y = argument3;
    var radius_x = argument4;
    var radius_y = argument5;
    
    // Calculate the normalized distance between the point and the center of the ellipse
    var dx = (xx - center_x) / radius_x;
    var dy = (yy - center_y) / radius_y;
    return ( (dx * dx) + (dy * dy) <= 1 );
}
