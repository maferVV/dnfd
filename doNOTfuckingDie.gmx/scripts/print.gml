/// print(message to be shown on screen)
// works with the game manager to show messages
// on the screen and the debug GM bottom window
var s = argument0;
with(objGameManager)
{
    print_msg = "#"+s;
    print_msg_alpha = 1;
}
var arr = tmc_string_split(s, "#");
for(var i = 1; i<=arr[0]; i++)
{
    show_debug_message(arr[i]);
}
