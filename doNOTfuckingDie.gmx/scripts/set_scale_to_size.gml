/// set_scale_to_size(num)
{
    var n = argument0;
    image_xscale = n/sprite_get_width(sprite_index);
    image_yscale = n/sprite_get_height(sprite_index);
}
