draw_pause_overlay = true;
paused_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_set_target(paused_surf);
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
surface_reset_target();
