set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
ui_panel_prepare(obj_ui_button, fl_add_button, array("settingsHowToPlay",0,0,0,0,nat("How To Play")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("SettingsRemapInput1",0,0,0,0,nat("Controls")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("settingsDisplay",0,0,0,0,nat("Display/Graphics")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("settingsSound",0,0,0,0,nat("Sound")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("settingsCredits",0,0,0,0,nat("Credits")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("backFromSettings",0,0,0,0,nat("Back")) );
// Center in view
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
