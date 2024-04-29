
var move_speed = 5;
x += ( keyboard_check(ord("D")) - keyboard_check(ord("A")) ) *move_speed;
y += ( keyboard_check(ord("S")) - keyboard_check(ord("W")) ) *move_speed;

var zoom_speed = 0.1;
view_zoom+=keyboard_check(ord("Q"))*zoom_speed;
view_zoom-=keyboard_check(ord("E"))*zoom_speed;
view_zoom = clamp(view_zoom, 1, view_max_zoom);
