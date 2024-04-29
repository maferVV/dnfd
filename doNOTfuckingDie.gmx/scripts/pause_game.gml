if(!paused)
{
    paused = true;
    
    audio_pause_all();
    // create_pause_surface();
    // pause_deactivate_objects();
    crSettings = array(mouse_is_locked(), objCursor.image_index, objCursor.image_xscale, objCursor.visible);
    cursor_set();
    
    ui_set_panel( create_panel_pause );
}

