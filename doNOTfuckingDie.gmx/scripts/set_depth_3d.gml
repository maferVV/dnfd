/// set_depth_3d()
// Set depth based on view_angle.
// This method gets the real coords on
// screen and adjusts depth accordigly.


set_new_coords_3d();
//use NewY to depth sort 
depth = -(newY+z)  +depthoffset;
