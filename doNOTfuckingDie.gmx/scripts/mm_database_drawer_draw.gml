/// mm_database_drawer_draw()

// draw chunks that are blueprint ready
var map = db.blueprints;
for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k))
{
    var str = tmc_string_split(k, ",");
    var xx = real(str[1]);
    var yy = real(str[2]);
    draw_set(animate_wave(0.5, 0.55, 3), c_lime);
    draw_rectangle( xx*chunk_size_pixels,
                    yy*chunk_size_pixels,
                    xx*chunk_size_pixels+chunk_size_pixels,
                    yy*chunk_size_pixels+chunk_size_pixels,
                    false);
}

draw_set(animate_wave(0.7, 0.8, 3), c_white);
draw_rectangle(chunk_x_in_room,
                chunk_y_in_room,
                chunk_x_in_room+chunk_size_pixels,
                chunk_y_in_room+chunk_size_pixels,
                false);

draw_set();
