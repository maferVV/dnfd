///triangle_wave(x, amplitude, period)
///         amplitude       height of the wave
///         period          length of wave
/// if amplitude and period are 1, the range is [0,1]
{
    var xx, amplitude, period;
    xx = argument0;
    amplitude = argument1;
    period = argument2;
    
    var half_period = period / 2;
    var x_in_period = (xx + half_period) % period;
    return (2 * amplitude / period) * (half_period - abs(x_in_period - half_period));
}
