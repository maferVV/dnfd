/// stackable_create()

// Include z
z = 0;
isStackable = true;
// Pixel height of each layer
height = 1;
// Quality is a frequency value.
// Shortens height at values lower than. 0.333.
quality = 1;
// Angle to draw the sprite towards (around the z axis)
draw_angle = 0;
// Camera reference
cam = objCamera;
if(!instance_exists(cam)) error("No camera found!", 1);
// Camera pitch
pitch = 0;
depthoffset = 0;
// how much does pitch affect layer offset?
// Camera pitch should be mapped to this values
pitch_min = cam.camera_pitch_min;
pitch_max = cam.camera_pitch_max;

// New coords on screen
newX = 0;
newY = 0;

// Shadows
draw_shadow = true;
shadow_distance = 5;
shadow_angle = degtorad(45); // in radians. Range [0, 2*pi]
shadow_alpha = 1;
shadow_color = merge_colour(c_dkgray, c_black, 0.7);
// create shadow drawer
if(draw_shadow) instance_singleton(objShadowDrawer);

//outline
outline = false;

// stackable animation
stack_anim_array = 0; //array
stack_anim_array[0] = sprite_index;
stack_anim_index = 0;
stack_anim_speed = 1;

//collider
canDrawCollider = false;
