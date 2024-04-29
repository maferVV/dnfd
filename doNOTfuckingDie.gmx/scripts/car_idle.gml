if(state_new)
{
    tmc_dt_set_friction(idlefric);
}
// d is the 360 direction of the inputs
var d = inputdog_direction("up","down","left","right",playerSlot);
tmc_dt_set_direction(movedir);
var j = inputdog_pressed("jump", playerSlot);
if(j) dt_zspeed += jumpspd;
tmc_dt_step_full();

if(d != -1)
    state_switch("moving");

