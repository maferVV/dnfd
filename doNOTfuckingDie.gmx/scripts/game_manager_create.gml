///

/// Executes once at the start of the game

show_debug_message("Created Game Manager");

/// debug
global.debug = true;
show_debug_overlay(true&&global.debug);

/// own enums
game_enums();

/// Menu option "game"
play_room = rmMenu + 1;

/// other persistent managers
instance_create(x, y, objDisplayManager);
instance_create(x, y, InputForPlayer1);

if(is_mobile())
    instance_create(x, y, objTouchControls);
else
    instance_create(x, y, objCursor);

/// Delta time
dt_create();

/// atex
ts_init();

/// Input Management
global.editPlayerSlot = -1;

/// jTranslate
global.langArray = array("en", "es");
global.langIndex = 0;
nat_set("en");

/// Room start variables
enable_console = true;
enable_detector = false;

// print()
display_print = true&&global.debug;
print_msg = "";
print_msg_prev = print_msg;
print_msg_alpha = 1;

/// Music and sounds
master_gain = 0.5;
music_gain = 0.9;
sfx_gain = 1;
music_array = 0; //array
audio_play_soundy(bmMeddle, 100, true, 1, 0) //temp

/// Pause
paused = false;
paused_surf = noone;
pause_panel = noone;
draw_pause_overlay = true;
pause_col = c_black;
// remember cursor settings when pausing/unpausing
crSettings = 0; //array
// whitelist
pause_whitelist_array[0] = objDisplayManager;
pause_whitelist_array[2] = InputManager;
pause_whitelist_array[3] = objConsole;
pause_whitelist_array[4] = objCamera;
pause_whitelist_array[5] = objDetector;
pause_whitelist_array[6] = objCursor;



// hold to quit game
pressed_to_quit = false; // enabled in game_end_friendly
quit_timer = 0;
time_to_quit = global.desired_fps * 0.5;
