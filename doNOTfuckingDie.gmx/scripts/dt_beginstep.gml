/// dt_beginstep()
/// delta time
//some real time based variables
var t= get_timer();
global.tmc_dt_time = t;
var dt = delta_time;
global.delta_t = dt * (paused==false);
global.total_t += global.delta_t;
global.delta_t /= 1000000;
global.tmc_dt_delta_t  =global.delta_t;
total_t_draw+=dt;
global.delta_step = global.tmc_dt_delta_t * global.desired_fps;

if(canToggleDrawing)
    draw_enable_drawevent(total_t_draw>next_draw_t || room_started)
if(total_t_draw>next_draw_t)
{
    next_draw_t = total_t_draw+1000000/DrawFPS;
}

room_started = false;

/*
print_vars( "current_time/1000              ", current_time/1000,
            "t                               ", t,
            "global.tmc_dt_time             ", global.tmc_dt_time,
            "global.tmc_dt_time/1000000    ", global.tmc_dt_time/1000000,
            "dt                              ", dt,
            "global.delta_t                 ", global.delta_t,
            "global.total_t                 ", global.total_t,
            "global.tmc_dt_delta_t (var dt)", global.tmc_dt_delta_t,
            "global.delta_step              ", global.delta_step
            );
