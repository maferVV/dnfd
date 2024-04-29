/// draw_sprite_3d(sprite, x, y, [xscale, yscale, angle, color, alpha, camera_up, pitch, quality, height])
var spr, xx, yy, xsca, ysca, ang, col, alpha, camera_up, pitch, quality, height,
    layers, pixel_height, quality_sprite_count;
if(argument_count<3) return error("not enough arguments", -1);
spr = argument[0];
xx = argument[1];
yy = argument[2];
xsca = 1;       if(argument_count> 3) xsca = argument[3];
ysca = 1;       if(argument_count> 4) ysca = argument[4];
ang = 0;        if(argument_count> 5) ang = argument[5];
col =  c_white; if(argument_count> 6) col = argument[6];
alpha = 1;      if(argument_count> 7) alpha = argument[7];
camera_up = 0;  if(argument_count> 8) camera_up = argument[8];
pitch = 1;      if(argument_count> 9) pitch = argument[9];
quality = 0;    if(argument_count>10) quality = argument[10];
height = 1;     if(argument_count>11) height = argument[11];

layers = sprite_get_number(spr);
pixel_height = pitch*height;
quality_sprite_count = pixel_height * quality;

for(var i=0; i < layers; i++)
{
    var ldx = lengthdir_x(i*pixel_height, camera_up);
    var ldy = lengthdir_y(i*pixel_height, camera_up);
    draw_sprite_ext(spr, i, xx+ldx, yy+ldy, xsca, ysca, ang, col, alpha);
    
    // hacer q se dijuben arriba, desde 0 hasta antes de la ultima
    if(quality_sprite_count >= 1)
    {
        for(var j=0; j<quality_sprite_count; j++)
        {
            var ldx = lengthdir_x( ( i + j/quality_sprite_count ) * pixel_height, camera_up);
            var ldy = lengthdir_y( ( i + j/quality_sprite_count ) * pixel_height, camera_up);
            draw_sprite_ext(spr, i, xx+ldx, yy+ldy, xsca, ysca, ang, col, alpha);
        }
    }
}
