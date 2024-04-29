window_zoom=argument0;
      
if(window_zoom>window_max_zoom)
  window_zoom=1;
window_zoom = clamp(window_zoom, 1, window_max_zoom);

print("window_zoom: " + string(window_zoom));
  
window_set_size(ideal_width*window_zoom,ideal_height*window_zoom);

// may be resource heavy
surface_resize(application_surface,ideal_width*window_zoom,ideal_height*window_zoom);

alarm[0]=2;
