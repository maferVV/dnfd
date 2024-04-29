/*
    argument0 - x
    argument1 - y
    argument2 - symbol to draw
*/

var col=draw_get_colour();

draw_set_colour(make_colour_hsv(current_time/10+argument0 mod 256, 200, 200))
draw_text(argument0, argument1, argument2)

draw_set_colour(col)



