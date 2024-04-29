/// ranges_overlap(a1, a2, b1, b2)
/// Tests overlap for ranges [a1, a2] and [b1, b2]

{
    var a1, a2, b1, b2;
    a1 = argument0;
    a2 = argument1;
    b1 = argument2;
    b2 = argument3;
    return ( max(a2, b2)-min(a1, b1) ) < ( (a2-a1)+(b2-b1) )
}
