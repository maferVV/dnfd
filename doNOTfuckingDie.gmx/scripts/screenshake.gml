/// screenshake(steps, force, [force_reduction])

if(argument_count < 2) return error("shake",-1);
var _steps = argument[0];
var _force = argument[1];
var _force_reduction = 0;
if(argument_count > 2)
    _force_reduction = argument[2];

if(!instance_exists(objCamera)){return error("No camera to shake", -1);}
with(objCamera)
{
    dt_alarm[0] = _steps;
    shake = _force;
    shakereduction = _force_reduction;
}
