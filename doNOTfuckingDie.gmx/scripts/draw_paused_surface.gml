/// this used to be in the draw event of objGameManager
if((paused)&&surface_exists(paused_surf))
{
    /// Surface coordinates must be modified because a view rotates around the center
    /// while a surface rotates around the top left.
    
    // original coords
    var ox = view_xview;
    var oy = view_yview;
    // center view coords
    var mx = view_xview + view_wview*0.5;
    var my = view_yview + view_hview*0.5;
    // Get offset. If added to center coords gives us the correct surface draw coords
    var len = point_distance(mx, my, ox, oy);
    var dir = point_direction(mx, my, ox, oy) - view_angle;
    
    /// Modify surface scale based on view rescaling as well
    var xscale = view_wview/surface_get_width(paused_surf);
    var yscale = view_hview/surface_get_height(paused_surf);
    
    // overlay color
    var col = c_white;
    var a = 1;
    if(draw_pause_overlay)
    {
        col = c_gray;
    }
    draw_surface_ext(paused_surf,
                        mx + lengthdir_x(len, dir),
                        my + lengthdir_y(len, dir),
                        xscale,
                        yscale,
                        -view_angle,
                        col,
                        a);
}
