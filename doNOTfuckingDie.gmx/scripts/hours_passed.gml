/// hours_passed()
// gets amount of hours passed in the day. 1-24
{
    var twm = instance_find(objWorldManager, 0);
    if(twm == noone) return error("no twm", 1);
    
    return floor(minutes_passed div 60);
}
