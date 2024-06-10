//draw_circle(x, y, random(60), 0);

if(ready)
{
    draw_sprite_outlined(sprDiceFace,
                        face_index,
                        x + face_xoffset,
                        y + face_yoffset,
                        image_xscale*face_xscale,
                        image_yscale*face_yscale,
                        face_angle,
                        image_blend,
                        c_black);
}
else
{
    draw_sprite_ext(sprDiceFace,
                    face_index,
                    x + face_xoffset,
                    y + face_yoffset,
                    image_xscale*face_xscale,
                    image_yscale*face_yscale,
                    face_angle,
                    image_blend,
                    image_alpha);
}
                
draw_sprite_ext(sprDiceValue,
                value_index,
                x + value_xoffset,
                y + value_yoffset,
                image_xscale*value_xscale,
                image_yscale*value_yscale,
                value_angle,
                image_blend,
                image_alpha);
                

