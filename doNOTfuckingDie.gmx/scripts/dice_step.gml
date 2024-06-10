depth = player_interface.depth - 100;
set_scale(player_interface.dice_xscale);

if(rolling)
{
    if( (floor(dt_image_index) mod 1) == 0)
    {
        var move = sprite_width*0.04;
        face_index = random( sprite_get_number(sprDiceFace) );
        face_xoffset = random_range(-move, move);
        face_yoffset = random_range(-move, move);
        face_angle = choose(0, 90, 180, 270) + gauss(0,0.5);
        face_xscale = choose(-1, 1);
        face_yscale = choose(-1, 1);
        move = sprite_width*0.02;
        value_index = random( sprite_get_number(sprDiceValue) );
        value_xoffset = random_range(-move, move);
        value_yoffset = random_range(-move, move);
        value_angle = face_angle;
    }
}
else
{
    dt_image_speed = 0;
    value_xoffset = face_xoffset;
    value_yoffset = face_yoffset;
    value_angle = face_angle;
}

value = floor(value_index)+1;

if(!ready && (tmc_dt_get_speed()==0))
    ready = true;

if(ready)
{
    x = lerp(x, xstart, 0.3);
    y = lerp(y, ystart, 0.3);
    value_angle = 0;
}
    
/// bounce on limits
var guiw = display_get_gui_width();
var guih = display_get_gui_height();

if( canBounceH && (decimal_bbox_left() < 0)||(decimal_bbox_right() > guiw))
{
    canBounceH = false;
    dt_alarm[0] = bounceCooldown;
    tmc_dt_set_hspeed( -tmc_dt_get_hspeed() );
}

if( canBounceV && (decimal_bbox_top() < 0)||(decimal_bbox_bottom() > guih))
{
    canBounceV = false;
    dt_alarm[1] = bounceCooldown;
    tmc_dt_set_vspeed( -tmc_dt_get_vspeed() );
}   
     
tmc_dt_step_full();
