///tmc_string_replace_args(string,arg0,arg1,...,arg14)
/*
    replaces occurrences of %0, %1,%2...%14 a in the string with the data in the subsequent arguments.
    
    string - the string to replace the %0...%14 tags with
    arg0 - arg14, the values to use for the replace
    
    var s = tmc_string_replace_args("Hello %0! You told me you are %1 years old. Is that correct",Name,Age);
*/
if(argument_count>1)
{
    var r = string(argument[0]);
    for (var i = argument_count-1; i>0; i--)
    {
        r = string_replace_all(r,"%"+string(i-1),string(argument[i]));
    }
    return r;
}
return argument[0];
