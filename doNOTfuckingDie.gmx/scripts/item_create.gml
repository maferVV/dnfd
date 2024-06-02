event_inherited();
collision_object = objSolidParent;
collision_type = bbox_type.simple;
tmc_dt_set_friction(8);
canDrawCollider = false&&global.debug;
bounce = 0.5;
