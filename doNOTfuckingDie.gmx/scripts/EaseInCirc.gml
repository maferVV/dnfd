/// EaseInCirc(inputvalue,outputmin,outputmax,inputmax)
// This is a really radical curve... haha hidden programmer joke.
argument0 /= argument3;
return argument2 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
