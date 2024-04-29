/// create_panel_controls()
set_sprite_size(700,400);
// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);
// go through each input ("left", "right", etc)
for(i=0; i<ds_list_size(INPUT_MANAGER.inputs); i++)
{
    var INPUT = INPUT_MANAGER.inputs[| i];
    ui_panel_prepare( obj_ui_panel,
                        create_panel_input,
                        array("input_"+string(i),0,0,0,0,nat(INPUT),INPUT) );
}
ui_panel_prepare(obj_ui_panel,
                        create_panel_buttons,
                        array("buttons_default_input",0,0,0,0,nat("Default settings"),
                                "controlsLoadDefaultKeyboardInputs", nat('Default Keyboard'), false,   // button1
                                "controlsLoadDefaultGamepadInputs", nat('Default Gamepad'), false )    // button2
                    );
ui_panel_prepare(obj_ui_panel,
                        create_panel_tabGroup,
                        array("tabs_gp_api",0,0,0,0,nat("Gamepad Input API"),
                                "controlsXInput", nat('XInput'), !INPUT_MANAGER.directInput,                       // tab1
                                "controlsDirectInput", nat('DirectInput (legacy)'), INPUT_MANAGER.directInput )    //tab2
                    );

ui_panel_prepare(obj_ui_button, fl_add_button, array("inputRemappingBackToSettings",0,0,0,0,nat("Back")) );

ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
