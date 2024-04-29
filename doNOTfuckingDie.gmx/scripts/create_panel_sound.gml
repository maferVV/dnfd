set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
ui_panel_prepare(obj_ui_panel,
                        create_panel_horSlider,
                        array("settingsSetMasterGain",0,0,0,0,nat("Master volume"),objGameManager.master_gain * 100,0,100,1)
                    );
ui_panel_prepare(obj_ui_panel,
                        create_panel_horSlider,
                        array("settingsSetMusicGain",0,0,0,0,nat("Music volume"),objGameManager.music_gain * 100,0,100,1)
                    );
ui_panel_prepare(obj_ui_panel,
                        create_panel_horSlider,
                        array("settingsSetSfxGain",0,0,0,0,nat("SFX volume"),objGameManager.sfx_gain * 100,0,100,1)
                    );
ui_panel_prepare(obj_ui_button, fl_add_button, array("backSettings",0,0,0,0,nat("Back")) );
// Center in view
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
