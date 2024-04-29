/// angle_normalize(ang)
// Transforms number into its 1-360 equivalent
var n = argument0;
n = n mod 360;
if (n < 0) n += 360;
return n;
