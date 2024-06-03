///getKeyboardString(key_code(ord))
var ORD = argument0;
var CHR = chr(ORD);

switch(ORD)
{
    case vk_control: return nat("ctrl"); break;
    case vk_space: return nat("space"); break;
    case vk_shift: return nat("shift"); break;
    case vk_lshift: return nat("l_shift"); break;
    case vk_rshift: return nat("r_shift"); break;
    case vk_alt: return nat("alt"); break;
    case vk_enter: return nat("enter"); break;
    case vk_escape: return nat("esc"); break;
    case vk_tab: return nat("tab"); break;
    case mb_left: return nat("l_mouse"); break;
    
    case vk_decimal: return nat("."); break;
    case vk_delete: return nat("delete"); break;
    
    case vk_add: return nat("+"); break;
    case vk_subtract: return nat("-"); break;
    case vk_multiply: return nat("*"); break;
    case vk_divide: return nat("/"); break;
    
    case vk_numpad0: return nat("NUM_0"); break;
    case vk_numpad1: return nat("NUM_1"); break;
    case vk_numpad2: return nat("NUM_2"); break;
    case vk_numpad3: return nat("NUM_3"); break;
    case vk_numpad4: return nat("NUM_4"); break;
    case vk_numpad5: return nat("NUM_5"); break;
    case vk_numpad6: return nat("NUM_6"); break;
    case vk_numpad7: return nat("NUM_7"); break;
    case vk_numpad8: return nat("NUM_8"); break;
    case vk_numpad9: return nat("NUM_9"); break;
    
    case vk_left: return nat("left"); break;
    case vk_right: return nat("right"); break;
    case vk_up: return nat("up"); break;
    case vk_down: return nat("down"); break;
}

return CHR;
