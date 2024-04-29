/// create_panel_achievements()

set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
ui_panel_prepare(obj_ui_button, fl_add_button, array("backMenu",0,0,0,0,nat("Back")) );
// center
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
