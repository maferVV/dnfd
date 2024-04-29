/// pause_game_freeze(steps, exception array)

var steps = argument0;
var exceptions = argument1; //array

if(!paused)
{
    paused = true;
    
    alarm[0] = steps;
}
