/// hash_function3(value1, value2, value3)
//
{
    var prime1 = 53; // https://www.planetmath.org/goodhashtableprimes
    var prime2 = 97;
    var hash = prime1*prime2*argument0 + prime2*argument1 + argument2;
    return hash;
}
