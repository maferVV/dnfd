///mm_chunk_manager_draw()

// draw culling corners
/// draw debug
if(true)
{
    draw_set(animate_wave(0.3, 0.5), c_black);
    var w = 2.5;
    draw_line_width(culling_x1,culling_y1,culling_x4,culling_y1, w);
    draw_line_width(culling_x1,culling_y1,culling_x1,culling_y4, w);
    draw_line_width(culling_x4,culling_y4,culling_x4,culling_y1, w);
    draw_line_width(culling_x4,culling_y4,culling_x1,culling_y4, w);
    draw_set();
    
    var r = 20;
    draw_debug_point(culling_x1, culling_y1, "p1");
    draw_debug_point(culling_x4, culling_y1, "p2");
    draw_debug_point(culling_x1, culling_y4, "p3");
    draw_debug_point(culling_x4, culling_y4, "p4");
    draw_set();
}
// draw the 3 main states me care about:
// blueprints, not instantiated
// instantiated, invisible
// instantiated and visible

