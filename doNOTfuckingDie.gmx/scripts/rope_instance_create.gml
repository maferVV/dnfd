///rope_instance_create(x, y, dir, width, height, segments, mask, density, collision_group);

var _x, _y, _dir, _width, _height, _segments, _mask, _density, _collision_group,
    _id;

_x = argument0;
_y = argument1;
_dir = argument2;
_width = argument3;
_height = argument4;
_segments = argument5;
_mask = argument6;
_density = argument7;
_collision_group = argument8;

_id = instance_create(x, y, objRope);
with( _id )
{
    rope_index = rope_create(_x, _y, _dir, _width, _height, _segments, _mask, _density, _collision_group);
}

return _id;
