///create_panel_pause()
set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
ui_panel_prepare(obj_ui_button, fl_add_button, array("unpause",0,0,0,0,nat("Continue playing")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("menuSettings",0,0,0,0,nat("Settings")) );
ui_panel_prepare(obj_ui_button, fl_add_button, array("gameBackMenu",0,0,0,0,nat("Back to menu")) );
// Center in view
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
