/// player_set_focus(obj)

var cam = objCamera;
var player = argument0;

if(player == noone) return error("noo player found", 1);

cam.follow = player;
with(player)
{
    isPlayerControlled = true;
    //print_vars("isPlayerControlled", isPlayerControlled, "input_direction", input_direction);
}
