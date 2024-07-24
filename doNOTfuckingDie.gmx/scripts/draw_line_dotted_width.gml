/// draw_line_dotted_width(x1, y1, x2, y2, w, f)
/// GMLscripts.com/license

var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3, w = argument4, f = argument5;
var dist = point_distance(x1, y1, x2, y2) * f; //Random factor to scale it to an appropriate length

for (var i = 0; i < dist; i++) {
    xx[i] = x1 + (x2 - x1) * (i / dist);
    yy[i] = y1 + (y2 - y1) * (i / dist);
}

for (var i = 0; i < dist - 1; i += 2) {
    draw_line_width(xx[i], yy[i], xx[i+1], yy[i+1], w);
}
