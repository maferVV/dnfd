/// draw_fov(x, y, radius, angle, aperture_angle, [outline=false, precision=24])
// easier way to call draw_pie
{
    var xx, yy, radius, angle, aperture_angle, outline, prec;
    xx = argument[0];
    yy = argument[1];
    radius = argument[2];
    angle = argument[3];
    aperture_angle = argument[4];
    outline = false; if(argument_count > 5) outline = argument[5];
    prec = 24; if(argument_count > 6) prec = argument[6];
    
    var x1 = xx - radius;
    var y1 = yy - radius;
    var x2 = xx + radius;
    var y2 = yy + radius;
    
    var start_angle = angle - aperture_angle/2;
    var end_angle = angle + aperture_angle/2;
    var x3 = xx+lengthdir_x(radius, start_angle);
    var y3 = yy+lengthdir_y(radius, start_angle);
    var x4 = xx+lengthdir_x(radius, end_angle);
    var y4 = yy+lengthdir_y(radius, end_angle);
    draw_pie(x1, y1, x2, y2, x3, y3, x4, y4, outline, prec);
}
