/// mm_database_drawer_draw()


draw_set(animate_wave(0.7, 0.8, 3), c_white);
draw_rectangle(chunk_x_in_room,
                chunk_y_in_room,
                chunk_x_in_room+chunk_size_pixels,
                chunk_y_in_room+chunk_size_pixels,
                false);

draw_set();
