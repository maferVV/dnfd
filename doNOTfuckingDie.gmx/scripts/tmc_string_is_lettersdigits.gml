///tmc_string_is_lettersdigits(str)
/*
    returns if the string is a letters and/or digit only string
    
    NOT A NUMBER BUT DIGITS ONLY
    var t = string_is_digit("1234"); //t = 1;
    var t = string_is_digit("123.4"); //t = 0;
    var t = string_is_digit("A123"); //t = 1;
    var t = string_is_digit("123B"); //t = 0;
    var t = string_is_digit("ABC123.00"); //t = 0;
*/
if(argument0 == "") return 0;

return(string_lettersdigits(argument0) == argument0);
