// dt_alarm
var dt = global.tmc_dt_delta_t;

for(var i = 0; i < array_length_1d(dt_alarm); i++)
{
    if(dt_alarm[i] >= 0)
    {
        // count down
        dt_alarm[i] = dt_alarm[i] - global.delta_step;
    }
    else if(dt_alarm[i] != dt_alarm_off)
    {
        // turn off alarm and perform respective event
        dt_alarm[i] = dt_alarm_off;
        event_perform(ev_alarm, i);
    }
}
