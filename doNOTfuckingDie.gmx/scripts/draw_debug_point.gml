/// draw_debug_point(x, y, str="", size=20, layers=3)
{
    var xx, yy, size, str, layers, rad, col1, col2, col;
    col1 = draw_get_colour();
    col2 = color_invert(col1);
    if(argument_count<2) return error("Not enough args", 1);
    xx = argument[0];
    yy = argument[1];
    str = "";       if(argument_count>2) str=argument[2];
    size = 20;      if(argument_count>3) size=argument[3];
    layers = 3;     if(argument_count>4) layers=argument[4];
    for(var i = layers; i > 0; i--)
    {
        rad = i/layers * size;
        col = col1; if(!is_even(i)) col = col2;
        draw_set(draw_get_alpha(), col);
        draw_circle(xx, yy, rad, false);
        draw_set();
    }
    draw_text_outlined(xx, yy, str, col1, col2);
}
