/// drawgui_to_room(GUIx, GUIy)
// Converts drawgui coords to room coordinates
// Returns an array [roomX, roomY]
{
    var GUIx, GUIy;
    GUIx = argument0;
    GUIy = argument1;
    var ScreenViewCenterX = view_wport / 2;
    var ScreenViewCenterY = view_hport / 2;
    var Zoom = view_wport[0] / view_wview[0];
    var MyDistanceFromScreenViewCenter = point_distance(ScreenViewCenterX,ScreenViewCenterY,GUIx,GUIy);
    var MyDirectionFromScreenViewCenter = point_direction(ScreenViewCenterX,ScreenViewCenterY,GUIx,GUIy);
    var MyDistanceFromWorldViewCenter = MyDistanceFromScreenViewCenter / Zoom;
        var MyDirectionFromWorldViewCenter;
        MyDirectionFromWorldViewCenter = MyDirectionFromScreenViewCenter;
        MyDirectionFromWorldViewCenter -= view_angle;
    
    var WorldViewCenterX = view_xview + (view_wview / 2);
    var WorldViewCenterY = view_yview + (view_hview / 2);
    var arr = 0; //return array
    arr[0] = WorldViewCenterX + lengthdir_x(MyDistanceFromWorldViewCenter,MyDirectionFromWorldViewCenter);
    arr[1] = WorldViewCenterY + lengthdir_y(MyDistanceFromWorldViewCenter,MyDirectionFromWorldViewCenter);
    return arr;
}
