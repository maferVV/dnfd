/// soundy_create_so(soundid, x, y, gain)
{
    var s, xx, yy, gain;
    s = argument0;
    xx = argument1;
    yy = argument2;
    gain = argument3;
    
    with(instance_create(xx, yy, objSound))
    {
        soundid = s;
        so_sound_after_create(gain);
    }
}
