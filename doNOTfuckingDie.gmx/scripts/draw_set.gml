/// draw_set([alpha], [color], [font], [halign fa_left/center/right], [valign fa_top/middle/bottom])

// Ommit argument to reset configuration to default.

{
    var argc, alpha, color, font, halign, valign;
    
    // defining default values
    if(!variable_global_exists("draw_set_default_alpha"))
    {
        global.draw_set_default_alpha = 1;
        global.draw_set_default_color = c_white;
        global.draw_set_default_font = fnt_mono;
        global.draw_set_default_halign = fa_left;
        global.draw_set_default_valign = fa_top;
    }
    
    // set default values
    argc = argument_count;
    alpha = global.draw_set_default_alpha;
    color = global.draw_set_default_color;
    font = global.draw_set_default_font;
    halign = global.draw_set_default_halign;
    valign = global.draw_set_default_valign;
    
    // get optionals
    if(argc>0) alpha = argument[0];
    if(argc>1) color = argument[1];
    if(argc>2) font = argument[2];
    if(argc>3) halign = argument[3];
    if(argc>4) valign = argument[4];
    
    // set
    draw_set_alpha(alpha);
    draw_set_colour(color);
    draw_set_font(font);
    draw_set_halign(halign);
    draw_set_valign(valign);
}
