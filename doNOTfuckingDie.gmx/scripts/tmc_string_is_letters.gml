///tmc_string_is_letters(str)
/*
    returns if the string is a letters nly string
    
    NOT A NUMBER BUT DIGITS ONLY
    var t = tmc_string_is_letters("1234"); //t = 0;
    var t = tmc_string_is_letters("123.4"); //t = 0;
    var t = tmc_string_is_letters("A123"); //t = 0;
    var t = tmc_string_is_letters("123B"); //t = 0;
    var t = tmc_string_is_letters("ABCD"); //t = 1;
*/
if(argument0 == "") return 0;

return(string_letters(argument0) == argument0);
