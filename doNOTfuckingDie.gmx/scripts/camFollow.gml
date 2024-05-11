/// Follow target

scrCamUpdate();

// follow camera
if(instance_exists(follow))
{
    x = follow.x;
    y = follow.y;
}

var zoomModeMax = 2;
if( inputdog_pressed("zoom") )
{
    zoomMode++;
    if(zoomMode >= zoomModeMax)
        zoomMode = 0;
}
switch(zoomMode)
{
    case 0: var view_zoom_desired = 2.5; break;
    default:
    case 3: var view_zoom_desired = 0.6; break;
}

view_zoom = lerp(view_zoom, view_zoom_desired, 0.06);
