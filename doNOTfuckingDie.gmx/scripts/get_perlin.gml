/// get_perlin(x, y, octaves, persistence, wavelength_modifier, lacunarity, [grid])
/// Coherent "Value" noise function.
var xx = argument[0];
var yy = argument[1];
var octaves = argument[2];
var pers = argument[3];
var wm = argument[4];
var lac = argument[5];
if(argument_count > 6)
    var grid = argument[6];

var value = 0;

var freq = 1 / (ds_grid_width(grid) / wm); // Frequency of starting octave.
var amp = pers;

var namp = 0; // Amplitude normalisation variable

for(var z =  0; z < octaves; z++){
    
    namp += amp;
    
    value += get_interpolated(xx * freq, yy * freq) * amp;
    
    freq *= lac;
    amp *= pers;

    fv = value / namp; // Basic range normalisation.

}

return fv;

