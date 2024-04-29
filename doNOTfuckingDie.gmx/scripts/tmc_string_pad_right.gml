///tmc_string_pad_right(string, desired_len, pad_char)
/*
    pads the right side of a string with the character specified so it is the desired length
    
    string is the string to pad
    
    desired_len is the desired length of the string
    
    pad_char is the character to use for padding
    
    if the string is smaller than the desired length then it is padded
    if the string is larger than the desired length then it is truncated
    
    var t = tmc_string_pad_right("ABC",6,"0"); //t = 'ABC000'
    
*/
var r = tmc_string_truncate_right(argument0,argument1);
var l = string_length(r);
var dl = argument1;
var pad = string_repeat(argument2,dl-l);
return r+pad;










