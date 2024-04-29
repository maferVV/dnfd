// culling


var ang = -view_angle;
var cx = view_xview+view_wview/2; // "view's center x"
var cy = view_yview+view_hview/2; // "view's center y"
var culling_scale = 1;
var outside_culling_scale = map_value(view_zoom, 1, view_max_zoom, 1.05, 2);
var unload_culling_scale = outside_culling_scale;
var xy;

xy = get_transformed_coordinates(cx, cy, view_xview, view_yview, ang, culling_scale);
culling_x1 = xy[0];
culling_y1 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview, ang, culling_scale);
culling_x2 = xy[0];
culling_y2 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview, view_yview+view_hview, ang, culling_scale);
culling_x3 = xy[0];
culling_y3 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview+view_hview, ang, culling_scale);
culling_x4 = xy[0];
culling_y4 = xy[1];

// outside
xy = get_transformed_coordinates(cx, cy, view_xview, view_yview, ang, outside_culling_scale);
outside_culling_x1 = xy[0];
outside_culling_y1 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview, ang, outside_culling_scale);
outside_culling_x2 = xy[0];
outside_culling_y2 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview, view_yview+view_hview, ang, outside_culling_scale);
outside_culling_x3 = xy[0];
outside_culling_y3 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview+view_hview, ang, outside_culling_scale);
outside_culling_x4 = xy[0];
outside_culling_y4 = xy[1];

// unload
xy = get_transformed_coordinates(cx, cy, view_xview, view_yview, ang, unload_culling_scale);
unload_culling_x1 = xy[0];
unload_culling_y1 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview, ang, unload_culling_scale);
unload_culling_x2 = xy[0];
unload_culling_y2 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview, view_yview+view_hview, ang, unload_culling_scale);
unload_culling_x3 = xy[0];
unload_culling_y3 = xy[1];

xy = get_transformed_coordinates(cx, cy, view_xview+view_wview, view_yview+view_hview, ang, unload_culling_scale);
unload_culling_x4 = xy[0];
unload_culling_y4 = xy[1];
