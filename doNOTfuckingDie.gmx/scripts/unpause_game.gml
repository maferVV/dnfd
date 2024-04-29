if(paused)
{
    paused = false;
    
    audio_resume_all();
    // surface_free(paused_surf); paused_surf = -1;
    // instance_activate_all();
    if(is_array(crSettings))
        cursor_set(crSettings[0], crSettings[1], crSettings[2], crSettings[3]);
    ui_destroy_panels();
}
