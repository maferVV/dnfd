/// debug_arrow(x1, y1, x2, y2, [text], [size], [time], [color])
// Instantiate an arrow
{
    var x1, y1, x2, y2, text, size, time, color, p;
    x1 = argument[0];
    y1 = argument[1];
    x2 = argument[2];
    y2 = argument[3];
    text = "";
        if(argument_count > 4) text = argument_count[4];
    size = 3;
        if(argument_count > 5) size = argument_count[5];
    time = 2.1*room_speed;
        if(argument_count > 6) time = argument_count[6];
    color = c_red;
        if(argument_count > 7) color = argument_count[7];
    
    p = particle_create( lerp(x1,x2,0.5) , lerp(y1,y2,0.5) );
    p.can_draw_arrow = true;
    p.draw_arrow_x1 = x1;
    p.draw_arrow_y1 = y1;
    p.draw_arrow_x2 = x2;
    p.draw_arrow_y2 = y2;
    p.draw_arrow_size = size;
    p.image_blend = color;
    p.text = text;
    p.destroy_at_alarm_0 = true;
    p.dt_alarm[0] = time;
    p.depth = -10000000;
    
    return p;
}
