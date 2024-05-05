/// array_to_string( array, [lpad = 3] )
{
    var arr, lpad, s;
    arr = argument0;
    lpad = 3; if(argument_count > 1) lpad = argument[1];
    s = "ARRAY:";
    for(var i = 0; i < array_length_1d(arr); i++)
    {
        s += "#";
        s += "["+string_lpad(string(i),lpad,"0")+"] "+string( arr[i] );
    }
    return s;
}
