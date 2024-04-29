/// room_to_drawgui(x, y)
/// returns an array [newX, newY]
// Sets GUIx and GUIy, based on x,y arguments given.
// Compatible with views that change the height value to simulate pitch.
// https://www.pentadact.com/2015-01-27-help-me-with-a-trigonometry-problem-for-heat-signature/
{
    var xx = argument0;
    var yy = argument1;
    var ViewCenterX = view_xview[0] + (view_wview[0]/2);
    var ViewCenterY = view_yview[0] + (view_hview[0]/2);
    var wzoom = view_wport[0] / view_wview[0];
    var hzoom = view_hport[0] / view_hview[0];
    var angle = view_angle[0];
    // for some fucked up evil reason, the browser needs a different angle to be added??
    if( is_browser() ) angle = 0;
    
    var MyDistanceFromCenter = point_distance(ViewCenterX,ViewCenterY,xx,yy) * hzoom;
    var MyDirectionFromCenter = point_direction(ViewCenterX,ViewCenterY,xx,yy) + angle;
    
    var newX = (view_wport[0]/2) + lengthdir_x(MyDistanceFromCenter,MyDirectionFromCenter) * (wzoom/hzoom);
    var newY = (view_hport[0]/2) + lengthdir_y(MyDistanceFromCenter,MyDirectionFromCenter);
    
    return array(newX, newY);
}
