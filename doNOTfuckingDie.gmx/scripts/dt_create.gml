/// Delta time managment
/// based on tmc_dt_DeltaTController2_obj of example project
EngineFPS = 60; //running speed
DrawFPS = EngineFPS; //drawing speed, unusable for now
// This controller is [paused] aware.
// You can set this to true and the delta time will be 0
// while it's paused
        /*global.Paused = false;*/
//State for frame skipping
room_started = true;
next_draw_t = 0; //when is the next frame time to draw
total_t_draw = 0; //hold the time for the draw detection
global.delta_t = 0;
global.tmc_dt_delta_t = 0;
global.total_t = 0;
global.tmc_dt_time = get_timer();
global.desired_fps = DrawFPS;
global.delta_step = 0; // Supposed to always be a number around 1

// too many troubles on html5 target
canToggleDrawing = false;
