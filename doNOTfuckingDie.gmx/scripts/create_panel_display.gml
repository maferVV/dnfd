set_sprite_size(300,250);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
if( !is_browser() )
    ui_panel_prepare(obj_ui_panel,
                        create_panel_tabGroup,
                        array("tabs_fullscreen",0,0,0,0,nat("Fullscreen Mode"),
                                "displayModeFullscreenOn", nat('On'), window_get_fullscreen(),      // tab1
                                "displayModeFullscreenOff", nat('Off'), !window_get_fullscreen() )  //tab2
                    );
/// TODO: resolution dropdown
var options = 0; //array
for(var i = 0; i < objDisplayManager.window_max_zoom; i++)
{
    options[i] = string(objDisplayManager.ideal_width*(i+1)) + "x" + string(objDisplayManager.ideal_height*(i+1));
}

var args = arrays_merge(array("settingsSetResolution",0,0,0,0, nat("Resolution"), 0), options);
ui_panel_prepare(obj_ui_panel, create_panel_list, args);

args = arrays_merge(array("settingsSetLanguage",0,0,0,0, nat("Language"), global.langIndex), global.langArray);
ui_panel_prepare(obj_ui_panel, create_panel_list, args);

ui_panel_prepare(obj_ui_panel,
                        create_panel_tabGroup,
                        array("tabs_vsync",0,0,0,0,nat("Vsync"),
                                "displayModeVsyncOn", nat('On'), get_vsync(),      // tab1
                                "displayModeVsyncOff", nat('Off'), !get_vsync() )  //tab2
                    );

ui_panel_prepare(obj_ui_button, fl_add_button, array("backSettings",0,0,0,0,nat("Back")) );
// Center in view
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
