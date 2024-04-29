/// ds_list_add_array(list, array)
// Appends all array elements to list.
{
    var list, arr;
    for(var i = 0; i < array_length_1d(arr); i++)
    {
        ds_list_add(list, arr[i]);
    }
    return list;
}
