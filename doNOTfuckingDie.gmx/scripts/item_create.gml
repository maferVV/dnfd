event_inherited();
collision_object = objSolidParent;
collision_type = bbox_type.simple;
tmc_dt_set_friction(8);
canDrawCollider = false&&global.debug;
bounce = 0.5;
yoffset = 0;
item_name = "poop";
text = "";
interactable = true;
interact_script = item_pick_up;

// item toss anim
toss_anim_state = 0;  //0: not started 1: animating 2: finished
toss_anim_i = 0;
toss_anim_max = random_range(25,35);
yoffset_max = random_range(-5,-15);
set_depth();
