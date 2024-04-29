var dt = global.tmc_dt_delta_t;


scrCamCulling();

// Set ideal w,h based on zoom and pitch
ideal_wview = objDisplayManager.ideal_width/view_zoom;
ideal_hview = objDisplayManager.ideal_height/view_zoom * camera_pitch;

dw = ideal_wview - view_wview
dh = ideal_hview - view_hview
view_xview -= dw / 2;
view_yview -= dh / 2;

// smooth zoom
view_wview = ideal_wview;
view_hview = ideal_hview;

// smooth angle
var view_dist = angle_normalize(view_angle - ideal_angle); // "squaring" the distance
view_angle = lerp_angle(view_angle, ideal_angle, view_dist/360 *global.delta_step) + shakeAngle;

// smooth go to my x,y
view_xview = lerp(view_xview, x-view_wview/2, 0.1*global.delta_step) + shakeX;
view_yview = lerp(view_yview, y-view_hview/2, 0.1*global.delta_step) + shakeY;

// update shake value
shake -= shakereduction *global.delta_step;
shake = max(shake, 0); // never go under 0
if(shake > 0)
{
    shakeX = random_range(-shake,shake)*global.delta_step;
    shakeY = random_range(-shake,shake)*global.delta_step;
    shakeAngle = random_range(-shake*shakeAngleMultiplier,shake*shakeAngleMultiplier)*global.delta_step;
}
else
{
    shakeX = 0;
    shakeY = 0;
    shakeAngle = 0;
}

// clamp inside a segment
if instance_exists(segment)
{
    x = clamp(x, segment.x, segment.x+segment.sprite_width);
    y = clamp(y, segment.y, segment.y+segment.sprite_height);
    ideal_wview = segment.sprite_width;
    ideal_hview = round(ideal_wview / objDisplayManager.aspect_ratio);
    view_wview = ideal_wview;
    view_hview = ideal_hview;
}

tmc_dt_step_full();
