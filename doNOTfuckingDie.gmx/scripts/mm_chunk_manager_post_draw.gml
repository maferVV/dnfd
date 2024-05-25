///mm_chunk_manager_post_draw()

// draw culling corners
/// draw debug
if(false)
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
// draw the 3 main states we care about:
    // 1. blueprints, not instantiated
    // 2. instantiated, invisible
    // 3. instantiated and visible
// Assumes all chunks in chunks_entities are also in chunks_visibility
if( chunks_entities == noone ) return 0;
if(false)
{
    var chunk_size_pixels = db.chunk_size * db.tile_size_pixels;
    var x1 = view_xview;
    var y1 = view_yview;
    var x2 = view_xview+view_wview;
    var y2 = view_yview+view_hview;
    for(var xx = floor(x1/chunk_size_pixels); xx < ceil(x2/chunk_size_pixels); xx++)
    {
        for(var yy = floor(y1/chunk_size_pixels); yy < ceil(y2/chunk_size_pixels); yy++)
        {
            var key = mm_chunk_coords_to_key(xx, yy);
            var chunkIsInstantiated = chunks_entities[? key];
            var chunkIsVisible = chunks_visibility[? key];
            var color = c_white; var subimg = 0; var alpha = 1;
            if(!chunkIsInstantiated)
            {
                subimg = 1;
            }
            else
            {
                if( !chunkIsVisible )
                {
                    subimg = 2;
                }
                else
                {
                    subimg = 3;
                    alpha = 0.1;
                }
            }
            
            var xx_in_room = xx*chunk_size_pixels;
            var yy_in_room = yy*chunk_size_pixels;
            draw_sprite_ext(sprChunkIcons, subimg, xx_in_room+chunk_size_pixels/2, yy_in_room+chunk_size_pixels/2, 1, 1, 0, color, alpha);
        }
    }
}    

