/// draw_text_special(x, y, text, [halign, valign, font, w, count])

var xx=argument[0], yy=argument[1], text=argument[2], valign=fa_top, halign=fa_left, font=0, maxw=-1, count=-1;

if argument_count>=4
    halign=argument[3]
if argument_count>=5
    valign=argument[4]
if argument_count>=6
    font=argument[5]
if argument_count>=7
    maxw=argument[6]
if argument_count>=8
    count=argument[7]

var nt=text_format(text, font, maxw);
var ret=text_format_draw(xx, yy, nt, halign, valign, font, count);

text_format_destroy(nt)

return ret;
