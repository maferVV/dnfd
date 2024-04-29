/// billboard_create()

// Include z
z = 0;
isStackable = false;

// angle based on camera up
draw_angle = 0;

// Camera reference
cam = objCamera;
if(!instance_exists(cam)) error("No camera found!", 1);

// Camera pitch
pitch = 0;
depthoffset = 0;

// New coords on screen
newX = 0;
newY = 0;

// Shadows
draw_shadow = false;
shadow_distance = 5;
shadow_angle = degtorad(45); // in radians. Range [0, 2*pi]
shadow_alpha = 1;
shadow_color = merge_colour(c_dkgray, c_black, 0.7);
// create shadow drawer
if(draw_shadow) instance_singleton(objShadowDrawer);

//outline
outline = false;

//collider
canDrawCollider = false;
