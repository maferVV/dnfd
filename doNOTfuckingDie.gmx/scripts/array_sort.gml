/// array_sort(array, ascend)
//
//  Returns a sorted version of a given array.
//
//      array        array to sort, array
//      ascend       ascending (true) or descending (false) order, boolean
//
/// GMLscripts.com/license
{
    var _arr = argument0;
    var ascend = argument1;
    var list = ds_list_create();
    var count = array_length_1d(_arr);
    for (var i=0; i<count; i++) list[| i] = _arr[i];
    ds_list_sort(list, ascend);
    for (i=0; i<count; i++) _arr[i] = list[| i];
    ds_list_destroy(list);
    return _arr;
}
