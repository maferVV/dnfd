set_drawgui_coords();
if(debug_draw)
{
    var n = sprite_height*3;
    draw_text_outlined(GUIx,GUIy-n,string(sign(mask1)), c_white, c_black);
    draw_text_outlined(GUIx-n,GUIy,string(sign(mask2)), c_white, c_black);
    draw_text_outlined(GUIx+n,GUIy,string(sign(mask4)), c_white, c_black);
    draw_text_outlined(GUIx,GUIy+n,string(sign(mask8)), c_white, c_black);
    
    draw_set(1, c_white, fnt_mono, fa_center, fa_middle);
    draw_text_outlined(GUIx,GUIy,tile_name, c_white, c_black);
}
