/// ui_menu_callbacks()
// Process the UI callbacks
switch(other.name)
{
    // Main Menu
    case "menuPlay":
        room_goto(objGameManager.play_room);
        break;
    case "menuSettings":
        ui_set_panel( create_panel_settings );
        break;
    case "menuHighscores":
        ui_set_panel( create_panel_highscore );
        break;
    case "menuAchievements":
        ui_set_panel( create_panel_achievements );
        break;
    case "menuQuit":
        game_end();
        break;
        
    case "backFromSettings":
        if( room = rmMenu )
            ui_set_panel( create_panel_menu );
        else
            ui_set_panel( create_panel_pause );
        break;
        
    // back to menu
    case "backMenu":
        ui_set_panel( create_panel_menu );
        break;

    // Settings
    case "settingsDisplay":
        ui_set_panel( create_panel_display );
        break;
    case "settingsSound":
        ui_set_panel( create_panel_sound );
        break;
    case "settingsCredits":
        ui_set_panel( create_panel_credits );
        break;
    case "settingsHowToPlay":
        ui_set_panel( create_panel_howToPlay );
        break;
    case "SettingsRemapInput1":
        global.editPlayerSlot = 1;
        ui_set_panel( create_panel_controls );
        break;
    case "backSettings":
        ui_set_panel( create_panel_settings );
        break;
        
    // Display
    case "displayModeFullscreenOn":
        window_set_fullscreen(true);
        break;
    case "displayModeFullscreenOff":
        window_set_fullscreen(false);
        break;
    case "displayModeVsyncOn":
        set_vsync(true);
        break;
    case "displayModeVsyncOff":
        set_vsync(false);
        break;
    case "settingsSetResolution":
        var len = array_length_1d(other.items);
        var i = other.itemindex;
        if(i >= 0)
            with(objDisplayManager){ scrSetWindowSize(i+1); }
        break;
    case "settingsSetLanguage":
        var i = other.itemindex;
        if(i==0){nat_set("en");global.langStr="English";}
        if(i==1){nat_set("es");global.langStr="Español";}
        break;
    case "settingsSetLanguage_left":
        var field = fl_field_find("settingsSetLanguage_list");
        field.index -= 1;
        fl_field_refresh(field);
        with(field){nat_set(options[| index]); global.langIndex = index; }
        break;
    case "settingsSetLanguage_right":
        var field = fl_field_find("settingsSetLanguage_list");
        field.index += 1;
        fl_field_refresh(field);
        with(field){nat_set(options[| index]); global.langIndex = index; }
        break;
    case "settingsSetResolution_left":
        var field = fl_field_find("settingsSetResolution_list");
        field.index -= 1;
        fl_field_refresh(field);
        with(objDisplayManager){ scrSetWindowSize(field.index+1); }
        break;
    case "settingsSetResolution_right":
        var field = fl_field_find("settingsSetResolution_list");
        field.index += 1;
        fl_field_refresh(field);
        with(objDisplayManager){ scrSetWindowSize(field.index+1); }
        break;
    
    // SOUND
    case "settingsSetMasterGain_slider":
        var g = other.value[0]/100;
        with(objGameManager){ master_gain = g; setMusicGain(); }
        var field = fl_field_find("settingsSetMasterGain_indicator");
        with(field)
        {
            value = round(g*100);
        }
        break;
    case "settingsSetMusicGain_slider":
        var g = other.value[0]/100;
        with(objGameManager){ music_gain = g; setMusicGain(); }
        var field = fl_field_find("settingsSetMusicGain_indicator");
        with(field)
        {
            value = round(g*100);
        }
        break;
    case "settingsSetSfxGain_slider":
        var g = other.value[0]/100;
        with(objGameManager){ sfx_gain = g; playBeep(); }
        var field = fl_field_find("settingsSetSfxGain_indicator");
        with(field)
        {
            value = round(g*100);
        }
        break;
    case "inputRemappingBackToSettings":
        var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);
        with(INPUT_MANAGER) inputdog_load_custom_controls();
        //scrSaveInputMapping(); //save remapping always
        ui_set_panel( create_panel_settings );
        break;
    case "controlsLoadDefaultKeyboardInputs":
        var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);    
        with(INPUT_MANAGER) inputdog_load_default_keyboard_mapping();
        break;
    case "controlsLoadDefaultGamepadInputs":
        var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);    
        with(INPUT_MANAGER) inputdog_load_default_gamepad_mapping();
        break;
    case "controlsXInput":
        var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);        
        with(INPUT_MANAGER) directInput = false;
        break;
    case "controlsDirectInput":
        var INPUT_MANAGER = inputdog_find_inputmanager_child_by_player(global.editPlayerSlot);        
        with(INPUT_MANAGER) directInput = true;
        break;
        
    case "unpause":
        with(objGameManager){ if(paused) unpause_game(); }
        break;    
    case "gameBackMenu":
        room_goto(rmMenu);
        break;
            
    default:
        error("No callback found for ui element "+string(other.name),0);
        break;
}
