/// mm_tile_name_to_threshold(name)
{
    var name = argument0;
    switch(name)
    {
        case "water":       return 0.07; break;
        case "manglar":     return 0.15; break;
        case "beach":       return 0.25; break;
        case "mud":         return 0.40; break;
        case "forest":      return 0.55; break;
        case "grottoEdge":  return 0.59; break;
        case "grotto":      return 1; break;
    }
}
