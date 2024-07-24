/// @func   ds_list_add_map(parent_list, map)
///
/// @desc   Adds a map to a given list and marks it.
///         Marking ensures the data of a nested map is
///         included when its parent is encoded as JSON,
///         as well as destroyed when the parent is.
///
/// @param  {list}      parent      list data structure
/// @param  {map}       map         map to add to list
///
/// GMLscripts.com/license
{
    var parent, map;
    parent = argument0;
    map = argument1;
    var pos = ds_list_size(parent);
    ds_list_add(parent, map);
    ds_list_mark_as_map(parent, pos);
}
