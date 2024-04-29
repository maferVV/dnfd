var cursor = objCursor;
if(!mouse_is_locked())
    mouse_lock();
mouse_lock_update();

var angle_speed = 0.07;
ideal_angle+=mouse_get_delta_x()*angle_speed;
var pitch_speed = -0.01;
camera_pitch+=mouse_get_delta_y()*pitch_speed;
camera_pitch = clamp(camera_pitch, camera_pitch_min, camera_pitch_max);
var zoom_speed = 1;
view_zoom+=mouse_wheel_up()*zoom_speed;
view_zoom-=mouse_wheel_down()*zoom_speed;
view_zoom = clamp(view_zoom, 1, view_max_zoom);
