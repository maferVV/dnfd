/// text_refresh(text_id, font, maxw)

// refresh surface of current text

var l=argument0, font=argument1, maxw=argument2;

var text=l[| 0], surf=l[| 1];

if surface_exists(surf) surface_free(surf)

var nt=text_format(text, font, maxw);
var W=nt[| 0], H=nt[| 1], q=nt[| 2];

surf=surface_create(W+10, H+10);

surface_set_target(surf)
draw_clear_alpha(c_gray, 0)
text_format_draw(5, 5, nt, fa_left, fa_top, font)

surface_reset_target()
text_format_destroy(nt)

l[| 1]=surf

return surf;
