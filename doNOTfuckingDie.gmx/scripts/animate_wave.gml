/// animate_wave(min = 0, max = 1, period = 1, i = current seconds )
/// For easy drawing, get a wave in a range and a custom speed.
/// It will navigate the wave every second
/// Senoidal wave based on https://www.desmos.com/calculator/f3omn5pml3
var _min, _max, _spd, _i, _r, _amp, _per, _alt;

_min=0;                             if(argument_count>0) _min=argument[0];
_max=1;                             if(argument_count>1) _max=argument[1];
_spd=1;                             if(argument_count>2) _spd=argument[2];
_i=global.total_t/1000000;      if(argument_count>3) _i=argument[3];

_r = abs(_max-_min);
_amp = _r/2;
_alt = min(_min,_max)+_amp;
_per = _spd;

return _amp*cos(2*pi*_i/_per)+_alt;
