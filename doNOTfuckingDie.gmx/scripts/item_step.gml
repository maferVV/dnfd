/// Move away from other items im colliding with
tmc_dt_step_push_away(objOverworldItem);

tmc_dt_step_full();
depth = -decimal_bbox_bottom();

item_toss_anim();
