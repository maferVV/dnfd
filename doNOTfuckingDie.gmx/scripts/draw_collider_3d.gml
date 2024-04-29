
draw_collider();
// draw cube surrounding 3d bounding box
var x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8,
    bbox_width, bbox_height;
bbox_width = bbox_right-bbox_left;
bbox_height = bbox_bottom-bbox_top;

// draw 4 points at the back
var zdir = -view_angle+90;
var bbox_back_len = bbox_back*pitch;
x1 = x + lengthdir_x(bbox_back_len, zdir) - bbox_width/2;
y1 = y + lengthdir_y(bbox_back_len, zdir) - bbox_height/2;
x2 = x + lengthdir_x(bbox_back_len, zdir) + bbox_width/2;
y2 = y + lengthdir_y(bbox_back_len, zdir) - bbox_height/2;
x3 = x + lengthdir_x(bbox_back_len, zdir) - bbox_width/2;
y3 = y + lengthdir_y(bbox_back_len, zdir) + bbox_height/2;
x4 = x + lengthdir_x(bbox_back_len, zdir) + bbox_width/2;
y4 = y + lengthdir_y(bbox_back_len, zdir) + bbox_height/2;
draw_circle(x1, y1, 3, true);
draw_circle(x2, y2, 3, true);
draw_circle(x3, y3, 3, true);
draw_circle(x4, y4, 3, true);

// draw the 4 points at the front
var bbox_front_len = bbox_front*pitch;
x5 = x + lengthdir_x(bbox_front_len, zdir) - bbox_width/2;
y5 = y + lengthdir_y(bbox_front_len, zdir) - bbox_height/2;
x6 = x + lengthdir_x(bbox_front_len, zdir) + bbox_width/2;
y6 = y + lengthdir_y(bbox_front_len, zdir) - bbox_height/2;
x7 = x + lengthdir_x(bbox_front_len, zdir) - bbox_width/2;
y7 = y + lengthdir_y(bbox_front_len, zdir) + bbox_height/2;
x8 = x + lengthdir_x(bbox_front_len, zdir) + bbox_width/2;
y8 = y + lengthdir_y(bbox_front_len, zdir) + bbox_height/2;

draw_circle(x5, y5, 3, true);
draw_circle(x6, y6, 3, true);
draw_circle(x7, y7, 3, true);
draw_circle(x8, y8, 3, true);

// now draw the lines bewteen the points
draw_line(x1, y1, x5, y5);
draw_line(x2, y2, x6, y6);
draw_line(x3, y3, x7, y7);
draw_line(x4, y4, x8, y8);

// draw uper face
draw_set(0.3);
draw_rectangle(x5, y5, x8, y8, false);
draw_set();
