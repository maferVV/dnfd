/// set_sprite_size(width, height)
// put -1 to use current value
{
    var w, h, curW, curH;
    
    curW = sprite_width;
    curH = sprite_height;
    w = curW; if((argument_count>0)&&(argument[0]!=-1)) w=argument[0];
    h = curH; if((argument_count>1)&&(argument[1]!=-1)) h=argument[1];
    
    image_xscale = w/sprite_get_width(sprite_index);
    image_yscale = h/sprite_get_height(sprite_index);
}
