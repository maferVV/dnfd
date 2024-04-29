/// initiate 3d collisions is separate from movement entity
/// because objSolid needs to access it.
is3D = true;
z = 0;
collision_type = bbox_type.simple;

// bbox for z dimension:
bbox_front = 0;
bbox_back = 0;
bbox_depth = 0; // bbox_front-bbox_back
