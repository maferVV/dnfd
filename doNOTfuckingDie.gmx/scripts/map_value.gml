/// map_value(current_value, current_lower_bound, current_upper_bound, desired_lower_bound, desired_upper_bound)
/// @description Maps a number from one range to another
/// @param current_value
/// @param current_lower_bound
/// @param current_upper_bound
/// @param desired_lower_bound
/// @param desired_upper_bound

var value = argument0; 
var current_lower_bound = argument1; 
var current_upper_bound = argument2; 
var desired_lower_bound = argument3; 
var desired_upper_bound = argument4; 

var total = current_upper_bound - current_lower_bound;
var percent = (value - current_lower_bound) / total;
var new_val = lerp(desired_lower_bound, desired_upper_bound, percent);

return new_val;
