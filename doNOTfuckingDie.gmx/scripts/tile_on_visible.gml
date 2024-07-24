/// tile_on_visible()
// returns bitmask value
{    
    var threshold = mm_tile_name_to_threshold( tile_name );
    mask1 = 0;
    mask2 = 0;
    mask4 = 0;
    mask8 = 0;
    
    var ins = instance_place(x,y-sprite_height,objMMTile);
    if( (ins!=noone) && threshold <= mm_tile_name_to_threshold(ins.tile_name) )
    {
        mask1 = 1;
    }
    
    ins =  instance_place(x-sprite_width,y,objMMTile);
    if( (ins!=noone) && threshold <= mm_tile_name_to_threshold(ins.tile_name) )
    {
        mask2 = 2;
    }
    
    ins = instance_place(x+sprite_width,y,objMMTile);
    if( (ins!=noone) && threshold <= mm_tile_name_to_threshold(ins.tile_name) )
    {
        mask4 = 4;
    }
    
    ins = instance_place(x,y+sprite_height,objMMTile);
    if( (ins!=noone) && threshold <= mm_tile_name_to_threshold(ins.tile_name) )
    {
        mask8 = 8;
    }
    
    image_index = (mask1 + mask2 + mask4 + mask8);
}
