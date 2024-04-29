/// draw_collider([color, flicker?, flickerspd])

{
    var mask, color, alpha, flicker, flickerspd;
    
    color = c_dkgray;   if(argument_count > 0) color = argument[0];
    flicker = true;     if(argument_count > 1) flicker = argument[1];
    flickerspd = 1;     if(argument_count > 2) flickerspd = argument[2];
    
    alpha = animate_wave(0, 0.5, 1/flickerspd);
    if(!flicker) alpha = 1;
    // If available, get mask index
    mask = sprite_index;
    if(mask_index!=-1) mask = mask_index;
    draw_sprite_ext(mask, 0, x, y, image_xscale, image_yscale, image_angle, color, alpha);
    
    var len = 10;
    draw_arrow(x, y, x+lengthdir_x(len, draw_angle), y+lengthdir_y(len, draw_angle), len);
}
