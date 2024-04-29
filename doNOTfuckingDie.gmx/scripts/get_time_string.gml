/// get_time_string( ampm = true )
{
    var ampm = true;
    if(argument_count > 0) ampm = argument[0];
    var twm = instance_find(objWorldManager, 0);
    if(twm == noone) return error("no twm", 1);
    
    var hours = 0;
    var mins = 0;
    var str = "";
    var strSuffix = "";
    
    with(twm)
    {
        hours = floor(minutes_passed div 60);
        if(ampm)
        {
            if(hours>12)
            {
                hours-=12;
                strSuffix = "pm";
            }
            else
            {
                strSuffix = "am";
            }
        }
        mins = floor(minutes_passed mod 60);
        str +=  string_lpad(string(hours),2,"0")
                +":"+
                string_lpad(string(mins),2,"0")
                +strSuffix;
    }
    
    return str;
}
