/// color_invert(color)
{
    var color = argument0;
    var red_comp = 255 - color_get_red(color);
    var green_comp = 255 - color_get_green(color);
    var blue_comp = 255 - color_get_blue(color);
    
    return make_colour_rgb(red_comp, green_comp, blue_comp);
}
