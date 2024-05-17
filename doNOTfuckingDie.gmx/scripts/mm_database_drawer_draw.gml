/// mm_database_drawer_draw()

// highlight chunks that are blueprint ready
var map = db.blueprints;
for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
{
    var arr = tmc_string_split(k, ",");
    if(arr[0] == 2)
    {
        var xx = real(arr[1]);
        var yy = real(arr[2]);
        draw_set(animate_wave(0.01, 0.05, 3), c_lime);
        draw_rectangle( xx*chunk_size_pixels,
                        yy*chunk_size_pixels,
                        xx*chunk_size_pixels+chunk_size_pixels,
                        yy*chunk_size_pixels+chunk_size_pixels,
                        true);
        // put coords in lower right corner
        draw_set(1, c_white, fnt_mono, fa_right, fa_bottom);
        draw_text_outlined(xx*chunk_size_pixels+chunk_size_pixels,
                            yy*chunk_size_pixels+chunk_size_pixels,
                            string(xx)+","+string(yy), c_white, c_black);
    }  
}

// chunk under cursor
draw_set(animate_wave(0.7, 0.8, 3), c_white);
draw_rectangle(chunk_x_in_room,
                chunk_y_in_room,
                chunk_x_in_room+chunk_size_pixels,
                chunk_y_in_room+chunk_size_pixels,
                false);
// Chunk text:
// Display if chunk is in perlin data 
var str = "";
var chunk_data = db.chunks[? mm_chunk_coords_to_key(chunk_x, chunk_y)];
if( !is_undefined(chunk_data) ) str+= "Perlin data!!"; else str+= ":c";
str+="#";
// Display if chunk is in blueprints
var chunk_blueprint = map[? mm_chunk_coords_to_key(chunk_x, chunk_y)];
if( !is_undefined(chunk_blueprint) )
{
    str+= "Blueprints!!";
    str+= " ("+string(ds_map_size(chunk_blueprint))+")";
}
else
    str+= ":c";
str+="#coords:"+string(chunk_x)+","+string(chunk_y);
draw_set(1, c_white, fnt_mono);
draw_text_outlined(chunk_x_in_room+1, chunk_y_in_room+1, str, c_white, c_black);

draw_set();
