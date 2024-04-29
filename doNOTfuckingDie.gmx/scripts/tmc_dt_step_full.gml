///tmc_dt_step_full()
/*
    Full delta time processing, including collisions and dt_alarm management.
    It's supposed to substitute tmc_dt_instance_step_fg().
    (not coded by tmc)
*/
if(is3D) bbox_3D_update();
var lowbounce = 2;
var dt = global.tmc_dt_delta_t;

dt_alarm_update();

dt_image_speed_update();

/// collisions
var yslope = 0; // for movement along a slope
// for the fraction of speed we are moving this step
var hspd = dt_hspeed * dt;
var vspd = dt_vspeed * dt;
var zspd = dt_zspeed * dt;

/// Move down a slope
// if we are moving on a solid and not going to hit a wall
if ( !place_meeting_3D(x+hspd, y, z, collision_object) &&
        (abs(hspd) > 0) &&
        place_meeting_3D(x, y+1, z, collision_object) )
{

    while( !place_meeting_3D(x+hspd, y-yslope, z, collision_object) && (yslope >= -abs(hspd)) )
    {
        yslope--;
    }
    
    // Make sure we actually need to move down
    if (yslope != 0 && place_meeting_3D(x+hspd, y-yslope+1, z, collision_object)) {
        y -= yslope;
    }
}

/// Horizontal collision check
if( place_meeting_3D(x+hspd, y, z, collision_object) )
{
    // Move up a slope
    while(place_meeting_3D(x+hspd, y-yslope, z, collision_object) && yslope <= abs(hspd))
    {
        yslope++;
    }
    
    if(place_meeting_3D(x+hspd, y-yslope, z, collision_object))
    {
        // Move to contact and bounce
        while(!place_meeting_3D(x+sign(hspd), y, z, collision_object)) {
            x+=sign(hspd);
        }
        
        // Update the horizontal speed
        dt_hspeed = -(dt_hspeed)*bounce;
        
        // Stop bounce at low values
        if(abs(dt_hspeed) < lowbounce) dt_hspeed = 0;
    }
    else
    {
        y-=yslope;
    }
}
if (!place_meeting_3D(x+hspd, y, z, collision_object))
{
    x += dt_hspeed * dt;
}

/// Vertical collision check
if (place_meeting_3D(x, y+vspd, z, collision_object)) {
    while (!place_meeting_3D(x, y+sign(vspd), z, collision_object))
    {
        y+=sign(vspd);
    }
    
    // Update the vertical speed
    dt_vspeed = -dt_vspeed*bounce;
    
    // Stop bounce at low values
    if (abs(dt_vspeed) < lowbounce) dt_vspeed = 0;
}
y += dt_vspeed * dt;

/// Zedical collision check
if (place_meeting_3D(x, y, z+zspd, collision_object)) {
    while (!place_meeting_3D(x, y, z+sign(zspd), collision_object))
    {
        z+=sign(zspd);
        bbox_3D_update();
    }
    
    // Update the zedical speed
    dt_zspeed = -dt_zspeed*bounce;
    
    // Stop bounce at low values
    if (abs(dt_zspeed) < lowbounce) dt_zspeed = 0;
}
if (!place_meeting_3D(x, y, z+zspd, collision_object))
    z += dt_zspeed * dt;

/// Apply friction
if(dt_friction !=0)
{
    var dir = tmc_dt_get_direction();
    var fh = lengthdir_x(dt_friction * dt*global.desired_fps,dir)
    if(fh !=0)
    {
        var oh = dt_hspeed;
        dt_hspeed-=fh;
        // avoid overshooting
        if(sign(oh)!=sign(dt_hspeed))
        {
            dt_hspeed = 0;
        }
    }
    var fv = lengthdir_y(dt_friction* dt*global.desired_fps,dir)
    if(fv !=0)
    {
        var ov = dt_vspeed;
        dt_vspeed-=fv;
        if(sign(ov)!=sign(dt_vspeed))
        {
            dt_vspeed = 0;
        }
    }
    
    dt_zspeed = approach(dt_zspeed, 0, dt_friction* dt*global.desired_fps);
}

/// Apply gravity
dt_hspeed+=dt_gravh*dt*global.desired_fps;
dt_vspeed+=dt_gravv*dt*global.desired_fps;
dt_zspeed+=dt_gravz*dt*global.desired_fps;
