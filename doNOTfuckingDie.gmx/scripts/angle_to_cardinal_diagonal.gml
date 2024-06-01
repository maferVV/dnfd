/// angle_to_cardinal_diagonal(ang)
// returns one of these numbers:
/***************************************************
              3   2   1
               \  |  /
                \ | /
             4--- . ---0
                / | \
               /  |  \
              5   6   7
 ***************************************************/
var angleDir = angle_normalize(argument0);
if( (angleDir >= 337.5) || (angleDir < 22.5) )
    return 0; // right
else if(angleDir >= 22.5 && angleDir < 67.5)
    return 1; // up-right
else if(angleDir >= 67.5 && angleDir < 112.5)
    return 2; // up
else if(angleDir >= 112.5 && angleDir < 157.5)
    return 3; // up-left
else if(angleDir >= 157.5 && angleDir < 202.5)
    return 4; // left
else if(angleDir >= 202.5 && angleDir < 247.5)
    return 5; // down-left
else if(angleDir >= 247.5 && angleDir < 292.5)
    return 6; // down
else if(angleDir >= 292.5 && angleDir < 337.5)
    return 7; // down-right

