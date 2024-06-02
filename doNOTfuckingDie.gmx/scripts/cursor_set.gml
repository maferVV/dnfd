/// cursor_set([lock=false], [subimg], [size], [visible=true])
/// sets cursor to default if empty

{
    var _cursor, _lock, _subimg, _size, _visible;
    _cursor = objCursor;
    
    _lock = false; if(argument_count > 0) _lock = argument[0];
    _subimg = _cursor.default_subimg; if(argument_count > 1) _subimg = argument[1];
    _size = _cursor.default_size; if(argument_count > 2) _size = argument[2];
    _visible = true; if(argument_count > 3) _visible = argument[3];
    
    with(_cursor)
    {
        if(_lock) mouse_lock(); else mouse_unlock();
        image_index = _subimg;
        set_scale(_size);
        visible = _visible;
    }
}
