/// stackable_draw()
/// Manages animations, sets 3d depth, draws shadows, draws stackable

var dt = global.tmc_dt_delta_t;
// Set depth based on view_angle
set_depth_3d();

// change form depending on camera 
var camera_up = -view_angle+90;
pitch = map_value(cam.camera_pitch, cam.camera_pitch_min, cam.camera_pitch_max, pitch_min, pitch_max);
// animation
stack_anim_index += stack_anim_speed*dt*global.desired_fps;
if(stack_anim_index >= array_length_1d(stack_anim_array)) stack_anim_index = 0;

// Draw in z coordinate
var zlen = z*pitch;
var zdir = camera_up;

// draw it!
draw_sprite_3d(stack_anim_array[floor(stack_anim_index)],
                x + lengthdir_x(zlen, zdir),
                y + lengthdir_y(zlen, zdir),
                image_xscale,
                image_yscale,
                draw_angle,
                image_blend,
                image_alpha,
                camera_up,
                pitch,
                quality,
                height);


if(canDrawCollider) { draw_collider_3d(); }
