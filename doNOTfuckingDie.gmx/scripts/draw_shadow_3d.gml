///draw_shadow_3d(sprite, pixel height, distance, x, y, xscale, yscale, rotation, angle, alpha, color)

var sprite = argument[0]
var layers = sprite_get_number(argument[0])
var height = argument[1]
var distance = argument[2]
var _x = argument[3]
var _y = argument[4]
var _xscale = argument[5]
var _yscale = argument[6]
var rot = argument[7]
var angle = argument[8]
var alpha = argument[9]
var color = argument[10]


for (i = 0; i < layers; i += 1){
    _y += sin(angle)*height*(distance/layers)
    _x += cos(angle)*height*(distance/layers)
    draw_sprite_ext(sprite, i, _x, _y, _xscale, _yscale, rot, color, alpha)
}
