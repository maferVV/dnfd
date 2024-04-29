/// hash_function(value1, value2, value3, ...)
// idk if this works
// https://www.planetmath.org/goodhashtableprimes
{
    var primes, hash;
    primes = array(53,97,193,389,769,1543,3079,6151,12289,24593,
                    49157,98317,196613,393241,786433,1572869,3145739,
                    6291469,12582917,25165843,50331653,100663319,201326611,
                    402653189,805306457,1610612741);
    hash = 0;
    for(var i = 0; i < argument_count; i++)
    {
        hash += argument[i] * primes[i];
    }
    return hash;
}
