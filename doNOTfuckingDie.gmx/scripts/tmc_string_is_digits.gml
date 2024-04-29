///tmc_string_is_digits(str)
/*
    returns if the string is a digit only string
    
    NOT A NUMBER BUT DIGITS ONLY
    var t = tmc_string_is_digits("1234"); //t = 1;
    var t = tmc_string_is_digits("123.4"); //t = 0;
    var t = tmc_string_is_digits("-123"); //t = 0;
    var t = tmc_string_is_digits("+123"); //t = 0;
    var t = tmc_string_is_digits("ABC123"); //t = 0;
*/
if(argument0 == "") return 0;

return(string_digits(argument0) == argument0);
