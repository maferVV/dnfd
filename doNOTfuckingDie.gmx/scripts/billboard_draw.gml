/// billboard_draw()

// depth
set_depth_3d();

var camera_up = -view_angle+90;

// change form
draw_angle = -view_angle;
pitch = cam.camera_pitch;

// Draw in z coordinate
var zlen = z*pitch;
var zdir = camera_up;


draw_sprite_ext(sprite_index,
                dt_image_index,
                x + lengthdir_x(zlen, zdir),
                y + lengthdir_y(zlen, zdir),
                image_xscale, 
                image_yscale*pitch, 
                image_angle + draw_angle, 
                image_blend, 
                image_alpha);

                
if(canDrawCollider) { draw_collider_3d(); }
