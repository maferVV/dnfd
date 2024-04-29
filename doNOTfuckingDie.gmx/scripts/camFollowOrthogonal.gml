/// Follow target
if(state_new)
{
    //
}
scrCamUpdate();

// Control camera
if(canControlMouse && mouse_is_locked())
{
    scrCamControlMouse();
}

if(canControlWASD)
{
    scrCamControlWASD();
}

// follow camera
if(instance_exists(follow))
{
    x = follow.x;
    y = follow.y;
}
