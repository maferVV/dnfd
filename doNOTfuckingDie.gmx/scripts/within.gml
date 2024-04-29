///within(n1, n2, within)
/*
 * Returns true if the given n1 is close enough
 * to the given n2 (within a certain number)
 */
var a = argument0;
var b = argument1;
var c = argument2/2;
return (a > b-c && a < b+c);
