///rope_cut(id, number)

var _id, _number;

_id = argument0;
_number = argument1;

ds_list_add(rp_cuts[@ _id], _number);
ds_list_sort(rp_cuts[@ _id], 1);

with (rp_segment[@ _id, _number]) {
  physics_joint_delete(rp_joint[@ 0]);
  physics_joint_delete(rp_joint[@ 1]);
}
