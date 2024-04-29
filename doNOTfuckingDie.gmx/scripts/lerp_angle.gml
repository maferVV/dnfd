/// lerp_angle(theta1, theta2, alpha)

var tempdir;
var alpha = argument2;
var theta1 = argument0;
var theta2 = argument1;
var diff = abs(theta1-theta2);
if (diff > 180)
{
    if (theta2 > 180)
    {
        angle = modulo(lerp(theta1,theta2 - 360,alpha),360);
    }
    else
    {
        angle = modulo(lerp(theta1,theta2 + 360,alpha),360);
    }
}
else
{
    angle = lerp(theta1,theta2,alpha);
}
return angle;
