/// arrays_merge(array, array2, [array3], ...)
{
    var arr;
    arr = argument[0];
    
    for(var i = 1; i < argument_count; i++)
    {
        var arrOther = argument[i];
        for(var j = 0; j < array_length_1d(arrOther); j++)
        {
            array_add(arr, arrOther[j]);
        }
    }
    return arr;
}
