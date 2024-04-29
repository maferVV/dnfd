/// rand_buffer()
// returns rand[rand_i], then increments rand_i
var t;
t = rand[rand_i];
rand_i++;
if(rand_i >= rand_max)
{
    rand_i = 0;
    error("randomizer looped",0);
}
return t;

