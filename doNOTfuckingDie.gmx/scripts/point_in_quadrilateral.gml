/// point_in_quadrilateral(px, py, x1, y1, x2, y2, x3, y3, x4, y4)
// only works with convex quadrilaterals. using
// https://stackoverflow.com/questions/5922027/how-to-determine-if-a-point-is-within-a-quadrilateral

var px, py, x1, y1, x2, y2, x3, y3, x4, y4, prec, qarea, ta1, ta2, ta3, ta4;
if(argument_count < 10) return error("NEA", -1);
px = argument[0];
py = argument[1];
x1 = argument[2];
y1 = argument[3];
x2 = argument[4];
y2 = argument[5];
x3 = argument[6];
y3 = argument[7];
x4 = argument[8];
y4 = argument[9];

prec = 0.02 // leeway to compare 2 floating points :]

qarea = triangle_area(x1, y1, x2, y2, x3, y3) + triangle_area(x4, y4, x2, y2, x3, y3);

ta1 = triangle_area(x1, y1, x2, y2, px, py);
ta2 = triangle_area(x1, y1, x3, y3, px, py);
ta3 = triangle_area(x2, y2, x4, y4, px, py);
ta4 = triangle_area(x3, y3, x4, y4, px, py);

return within(qarea, ta1+ta2+ta3+ta4, prec);
