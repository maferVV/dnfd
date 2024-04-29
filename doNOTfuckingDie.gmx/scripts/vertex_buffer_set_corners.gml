/// vertex_buffer_set_corners(buffer_id, x1, y1, x2, y2, blend=c_white, alpha=1)
/// sets vertices in a rectangle according to the real coords
{
    var buffer_id, x1, y1, x2, y2, _blend, _alpha;
    if(argument_count < 5) return error("not enough args", 1);
    buffer_id = argument[0];
    x1 = argument[1];
    y1 = argument[2];
    x2 = argument[3];
    y2 = argument[4];
    _blend = c_white; if(argument_count>5) _blend = argument[5];
    _alpha = 1; if(argument_count>6) _alpha = argument[6];
    
        /// triangle 1
    // top left
    vertex_position(buffer_id, x1, y1);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 0, 0);
    // top right
    vertex_position(buffer_id, x2, y1);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 0, 1);
    // bottom right
    vertex_position(buffer_id, x2, y2);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 1, 1);
        /// triangle 2
    // bottom right
    vertex_position(buffer_id, x2, y2);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 1, 1);
    // bottom left
    vertex_position(buffer_id, x1, y2);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 1, 0);
    // top left 
    vertex_position(buffer_id, x1, y1);
    vertex_colour(buffer_id, _blend, _alpha);
    vertex_texcoord(buffer_id, 0, 0);
}
