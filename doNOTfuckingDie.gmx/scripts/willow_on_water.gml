/// luz_on_water()
// returns true if touching floor water block

var man = objWorldManager;
if(!instance_exists(man)) return error("NO MANAGER", false);
var water = man.box_floor;
if(!instance_exists(water)) return error("NO water", false);

if( instance_place_3D(x, y, z-1, collision_object) == water )
    return true;

return false;
