/// set_room_coords()
// Sets real world coords to drawGUI coords
// needs GUIx, GUIy to exist
{
    var ScreenViewCenterX = view_wport / 2;
    var ScreenViewCenterY = view_hport / 2;
    var Zoom = view_wport[0] / view_wview[0];
    var MyDistanceFromScreenViewCenter = point_distance(ScreenViewCenterX,ScreenViewCenterY,GUIx,GUIy);
    var MyDirectionFromScreenViewCenter = point_direction(ScreenViewCenterX,ScreenViewCenterY,GUIx,GUIy);
    var MyDistanceFromWorldViewCenter = MyDistanceFromScreenViewCenter / Zoom;
    //var MyDirectionFromWorldViewCenter = MyDirectionFromScreenViewCenter – view_angle;
        var MyDirectionFromWorldViewCenter;
        MyDirectionFromWorldViewCenter = MyDirectionFromScreenViewCenter;
        MyDirectionFromWorldViewCenter -= view_angle;
    
    var WorldViewCenterX = view_xview + (view_wview / 2);
    var WorldViewCenterY = view_yview + (view_hview / 2);
    x = WorldViewCenterX + lengthdir_x(MyDistanceFromWorldViewCenter,MyDirectionFromWorldViewCenter)
    y = WorldViewCenterY + lengthdir_y(MyDistanceFromWorldViewCenter,MyDirectionFromWorldViewCenter)
}
