/// triangle_area(x1, y1, x2, y2, x3, y3)
var x1, y1, x2, y2, x3, y3;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
x3 = argument[4];
y3 = argument[5];

return 0.5*abs(x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2));
