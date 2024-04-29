/// modulo(n1, n2)
/// Ensures mod is always positive
if (argument0 < 0)
    return (argument0 mod argument1) + argument1;
else
    return argument0 mod argument1; 
