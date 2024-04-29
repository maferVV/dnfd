pause_panel = instance_create(0, 0, ui_panel);
with(pause_panel)
{
    //panel_fit_to_camera(0.25, 0.4);
    y = view_yview + ((view_hview-sprite_height)*0.6);
    uiVisible = false;
    uiAdjustToCamera = true;
    
    image_angle = view_angle;
    
    var rowHeight = sprite_height / 4;
    var yoffset = rowHeight + rowHeight*0.2;
    var _y = 0;
    
    if(true)
    {
        with(instance_create(x, y+_y, ui_button_ani))
        {
            uiButtonSprite= sprButtonDarkPlain;
            uiButtonSpriteDown= uiButtonSprite;
            uiUse9Slice = false;
            uiControlName="unpause";
            uiTextValue=nat('Continue playing');
            uiSetWidth= other.sprite_width;
            uiSetHeight= rowHeight;
            uiFont=fnt_rubik_menubig;
            uiDependant = other.id;
            uiAdjustToCamera = true;
            depth--;
        }
        _y += yoffset;
        with(instance_create(x, y+_y, ui_button_ani))
        {
            uiButtonSprite= sprButtonDarkPlain;
            uiButtonSpriteDown= uiButtonSprite;
            uiUse9Slice = false;
            uiControlName="gameBackMenu";
            uiTextValue=nat('Back to menu');
            uiSetWidth= other.sprite_width;
            uiSetHeight= rowHeight;
            uiFont=fnt_rubik_menubig;
            uiDependant = other.id;
            uiAdjustToCamera = true;
            depth--;
        }
        _y += yoffset;
    }
}
