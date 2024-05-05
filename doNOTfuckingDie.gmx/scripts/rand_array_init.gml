/// rand_array_init()
// Creates rand[] array, fills it up with [rand_max] random values [0-1[
// The values are always the same for the same seed, xx and yy values
// Creates/resets the instance variables rand[], rand_i, rand_max
{
    var seed, xx, yy;
    seed = argument0;
    xx = argument1;
    yy = argument2;
    rand = 0; // array
    rand_i = 0;
    rand_max = 100;
    random_set_seed( hash_function3(seed, xx, yy) );
    fill_rand_buffer();
}
