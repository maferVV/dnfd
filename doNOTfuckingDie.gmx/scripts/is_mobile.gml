switch(os_type)
{
    case os_uwp:     // windows tablet?? no se
    case os_unknown: // por si es un cel chino o algo no se
    case os_ios:
    case os_android:
    case os_psvita:
        return true;
        break;
    default:
        return false;
        break;
}

return false;
