/// minutes_passed increment

minutes_passed+=minute_spd*global.delta_step;
minutes_passed = minutes_passed mod 1440;

var curHour = hours_passed();

//print( "TIME: "+get_time_string(1) );

if(curHour != prevHour)
{
    // an hour has passed
    
    // Change shadow vars
    if( between(curHour, sunrise_hour, sunset_hour) ) //day
    {
        with( instance_singleton(objShadowDrawer) )
        {
            // set shadows
            desired_shadow_distance = map_value(abs(curHour - other.midday_hour), 0, 6, 5, 20);
            desired_shadow_angle = map_value(curHour, other.sunrise_hour, other.sunset_hour, degtorad(180), degtorad(0));
            // jump to correct place at first hour
            if(curHour==other.sunrise_hour)
            {
                shadow_distance=desired_shadow_distance;
                shadow_angle=desired_shadow_angle;
            }
            desired_shadow_alpha = 1;
        }
    }
    else // night
    {
        with( instance_singleton(objShadowDrawer) )
        {
            desired_shadow_alpha = 0;
        }
    }
    
    // Change color palette
    var strength_desired_set, lut_subimg_desired_set;
    var min_night_dark = 0.3;
    var max_night_dark = 1;
    var mid_night_dark = lerp(min_night_dark, max_night_dark, 0.666);
    switch(curHour)
    {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            strength_desired_set = map_value(curHour,0,5,mid_night_dark,max_night_dark);
            lut_subimg_desired_set = 1;
            break;
        case 6: // sunrise
            strength_desired_set = 1.1; lut_subimg_desired_set = 8; break;
        case 7:
            strength_desired_set = 0.4; lut_subimg_desired_set = 8; break;
        case 8:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 9:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 10:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 11:
            strength_desired_set = 0.1; lut_subimg_desired_set = 4; break;
        case 12: // midday
            strength_desired_set = 0.2; lut_subimg_desired_set = 4; break;
        case 13:
            strength_desired_set = 0.1; lut_subimg_desired_set = 4; break;
        case 14:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 15:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 16:
            strength_desired_set = 0.0; lut_subimg_desired_set = 0; break;
        case 17:
            strength_desired_set = 0.4; lut_subimg_desired_set = 8; break;
        case 18: // sunset
            strength_desired_set = 1.2; lut_subimg_desired_set = 8; break;
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
            strength_desired_set = map_value(curHour,19,23,min_night_dark,mid_night_dark);
            lut_subimg_desired_set = 1;
            break;
    }
    // apply
    with( objDisplayManager )
    {
        strength_desired = strength_desired_set;
        lut_subimg_desired = lut_subimg_desired_set;
        //state_switch("start");
    }
}

prevHour = curHour;
