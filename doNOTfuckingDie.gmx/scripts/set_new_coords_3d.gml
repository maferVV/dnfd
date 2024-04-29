/// set_new_coords_3d()


// old way

var CamDir = view_angle;
var _dist = point_distance(x,y,0,0);
var _dir = point_direction(0,0,x,y) + CamDir;
// values in the real camera
newX = lengthdir_x(_dist,_dir);
newY = lengthdir_y(_dist,_dir);

/*
// new way. its bad
// from https://www.samd.is/2020/04/10/sprite-stacking.html#setting-the-draw-depth-for-multiple-3d-objects
var deepestdepth = 1000;
depth = dot_product(x, y, lengthdir_x(1, -view_angle+90), lengthdir_y(1, -view_angle+90)) - deepestdepth;
*/
