/// create_panel_howToPlay()

set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
var str = file_text_open_read_all("howToPlay.txt");
ui_panel_prepare(obj_ui_label,
                    fl_add_label,
                    array("howToPlayLabel",0,0,0,0,str),
                    3
                );
ui_panel_prepare(obj_ui_button, fl_add_button, array("backSettings",0,0,0,0,nat("Back")) );
// center
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
