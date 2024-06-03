/// set_room_coords()
// Sets real world coords to drawGUI coords
// needs GUIx, GUIy to exist
{
    arr = drawgui_to_room(GUIx, GUIy);
    x = arr[0];
    y = arr[1];
}
