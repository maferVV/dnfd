/// set_vsync( vsync )
{
    var value = argument0;
    with(objDisplayManager)
    {
        display_reset(aa, value);
        vsync = value;
    }
}
