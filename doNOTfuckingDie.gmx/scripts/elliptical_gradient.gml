/// elliptical_gradient(radius_x, radius_y)
/// Elliptical gradient.
/// The farthest from center, the greater the number.
/// Technically it can go beyond your range (0, inf), 
/// so always clamp the output.

var radius_x = argument0;
var radius_y = argument1
var center_x = width / 2; //Center on X axis.
var center_y = height / 2; //Center on Y axis.

// Ellipse equation. Calculates value of a point depending on a distance from center. Center is 0.
var dce = ((power(radius_x-center_x,2))/power(center_x,2)) + ((power(radius_y-center_y,2))/power(center_y,2));

return clamp(dce, 0, 1);

