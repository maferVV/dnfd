/// position_meeting_gui(x, y, obj)
// Like position meeting, but transforms (x,y) to gui coordinates
{
    var xx, yy, obj, mouseCoords;
    xx = argument0;
    yy = argument1;
    obj = argument2;
    mouseCoords = room_to_drawgui(xx, yy);
    return position_meeting(mouseCoords[0],
                            mouseCoords[1],
                            obj);
}
