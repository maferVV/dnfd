///tmc_string_is_number(str)
/*
    returns if the string is a number
    
    allowed format is defined in tmc_string_number()
    
    var t = tmc_string_is_number("1234"); //t = 1;
    var t = tmc_string_is_number("1234."); //t = 1;
    var t = tmc_string_is_number("-1234."); //t = 1;
    var t = tmc_string_is_number("+1234.0"); //t = 1;
    var t = tmc_string_is_number("ABC123"); //t = 0;
*/
if(argument0 == "") return 0;

return(tmc_string_number(argument0) == argument0);
