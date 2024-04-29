/// blend(var1, var2, weight)
// returns a value between var1 and var2, determined by weight
// all values must be [-1, 1]

{
    var var1, var2, weight, w;
    var1 = argument0;
    var2 = argument1;
    weight = argument2;
    
    w = (weight+1) / 2;
    
    return (var1 * (1 - w) + var2 * w);
}
