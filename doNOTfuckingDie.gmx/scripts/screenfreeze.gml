/// screenfreeze(steps,[ exception1, exception2, etc])
if(argument_count==0) return -1;
var steps = argument[0];
if(steps<=0) return error("Invalid freeze steps amount", -1);
var exceptions = 0; //array
for(var i = 1; i < argument_count; i++)
{
    exceptions[i-1] = argument[i];
}

with(objGameManager)
{
    pause_game_freeze(steps, exceptions);
}

print("freeze");
