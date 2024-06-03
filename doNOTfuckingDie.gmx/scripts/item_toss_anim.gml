/// item_toss_anim()

if(toss_anim_state == 1) //animating
{
    toss_anim_i += 1*global.delta_step;
    toss_anim_i = clamp(toss_anim_i, 0, toss_anim_max);
    var curve = EaseOutBounce(toss_anim_i, 0, 1, toss_anim_max);
    yoffset = map_value(curve, 0, 1, yoffset_max, 0);
    if(toss_anim_i == toss_anim_max)
    {
        // finish animation
        toss_anim_state = 2;
        yoffset = 0;
    }
}
