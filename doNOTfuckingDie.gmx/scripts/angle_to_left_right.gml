/// angle_to_left_right(ang)
// returns one of these numbers:
/***************************************************

                -1 -------|------- 1

 ***************************************************/
var angleDir = angle_normalize(argument0);
if( (angleDir < 90) || (angleDir > 270) )
    return 1;
else
    return -1;
