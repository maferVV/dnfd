/// set_drawgui_coords()
/// The vars are set in the vars GUIx and GUIy.
/// This vars should be created previus to calling.
{
    var r = room_to_drawgui(x, y);
    GUIx = r[0];
    GUIy = r[1];
}
