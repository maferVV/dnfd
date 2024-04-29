///tmc_string_is_upper(str)
/*
    returns if the string is a upper casse
    
    WARNING the functions allow non alphabetical characters
    
    var t = tmc_string_is_upper("ABC"); //t = 1;
    var t = tmc_string_is_upper("abc"); //t = 0;
    var t = tmc_string_is_upper("1234"); //t = 1;
    var t = tmc_string_is_upper("1234."); //t = 1;
    var t = tmc_string_is_upper("-1234."); //t = 1;
    var t = tmc_string_is_upper("+1234.0"); //t = 1;
    
*/
if(argument0 == "") return 0;

return(string_upper(argument0) == argument0);
