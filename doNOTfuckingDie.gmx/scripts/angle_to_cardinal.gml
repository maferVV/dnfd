/// angle_to_cardinal(ang)
// returns one of these numbers:
/***************************************************
                        1  
                        |
                        |
                        |
                2-------|-------0
                        |
                        |
                        |
                        3
 ***************************************************/
var angleDir = angle_normalize(argument0);
if( (angleDir < 45)||(angleDir > 315) )
    return 0;
else if(angleDir <= 135)
    return 1;
else if(angleDir < 225)
    return 2;
else if(angleDir <= 315)
    return 3;
