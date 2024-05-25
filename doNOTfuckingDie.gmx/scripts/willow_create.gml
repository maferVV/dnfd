///willow_create()

/// Properties
// doginput
isPlayerControlled = false;
playerSlot = 1;
//movement
movespd = 0.1; //current spd
maxspd = 100;
movedir = 0;
dirspd = 0.1;
fric = 0;
idlefric = 5;
tmc_dt_instance_init();
is3D = false;
collision_object = objSolidParent;
collision_type = bbox_type.simple;
canDrawCollider = false&&global.debug;
bounce = 0;

/// Inputs
willow_defaultInputs();

/// FSM
state_machine_init();

state_create("idle", willow_idle);
state_create("moving", willow_moving);
state_create("stuck", willow_stuck);

state_init("idle");
