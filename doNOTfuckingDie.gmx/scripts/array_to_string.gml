/// array_to_string( array, [lpad = 3] )
{
    var arr, lpad, len, s;
    arr = argument0;
    lpad = 3; if(argument_count > 1) lpad = argument[1];
    len = array_length_1d(arr);
    if(len==0) return "ARRAY IS EMPTY!";
    s = "ARRAY:";
    for(var i = 0; i < len; i++)
    {
        s += "#";
        s += "["+string_lpad(string(i),lpad,"0")+"] "+string( arr[i] );
    }
    return s;
}
