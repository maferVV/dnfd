depth = player_interface.depth - 100;
set_scale(player_interface.dice_xscale);

if( (floor(dt_image_index) mod 1) == 0)
{
    var move = sprite_width*0.05;
    face_index = random( sprite_get_number(sprDiceFace) );
    face_xoffset = random_range(-move, move);
    face_yoffset = random_range(-move, move);
    face_angle = choose(0, 90, 180, 270) + gauss(0,0.5);
    face_xscale = choose(-1, 1);
    face_yscale = choose(-1, 1);
    move = sprite_width*0.03;
    value_index = random( sprite_get_number(sprDiceValue) );
    value_xoffset = random_range(-move, move);
    value_yoffset = random_range(-move, move);
    value_angle = choose(0, 90, 180, 270) + gauss(0,0.1);
}
tmc_dt_step_full();
