///tmc_string_trim(string)
/*
    trims all white space from the right and left of the string
    
    string is the string with whitespace
    
    a white space is any space or lesser ascii value in the string
    
    var t = tmc_string_trim("   Hello    "); //t = 'Hello'
    
*/
return tmc_string_trim_left(tmc_string_trim_right(argument0))
