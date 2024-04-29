set_sprite_size(300,250);
// Open 
var showPlay = true;
var showLeaderboard = true;
var showAchievements = true;
var showSettings = true;
var showExitGame = true;            if( is_browser() ){showExitGame=false;}

// Create form that listens to component inputs
myForm = instance_singleton(objMenuForm);
// Prepare panel components
if(showPlay) ui_panel_prepare(obj_ui_button, fl_add_button, array("menuPlay",0,0,0,0,nat("Play")),2);
if(showLeaderboard) ui_panel_prepare(obj_ui_button, fl_add_button, array("menuHighscores",0,0,0,0,nat("Leaderboard")) );
if(showAchievements) ui_panel_prepare(obj_ui_button, fl_add_button, array("menuAchievements",0,0,0,0,nat("Achievements")) );
if(showSettings) ui_panel_prepare(obj_ui_button, fl_add_button, array("menuSettings",0,0,0,0,nat("Settings")) );
if(showExitGame) ui_panel_prepare(obj_ui_button, fl_add_button, array("menuQuit",0,0,0,0,nat("Quit")) );
// Center in view
ui_panel_center_in_camera();
// Create prepared components
ui_panel_build();
