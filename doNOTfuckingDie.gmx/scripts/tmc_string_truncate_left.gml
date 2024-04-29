///tmc_string_truncate_left(string, desired_len)
/*
    truncates a string left characters so it is the desired length
    
    string is the string to truncate
    
    desired_len is the desired length of the string
    
    if the string is smaller than the desired length then it is unchanged
    
    var t = tmc_string_truncate_left("ABCDEFG",3); //t = 'EFG'
    
*/
var r = argument0;
var l = string_length(r);
var dl = argument1;

return string_copy(r,1+l-dl,dl);
