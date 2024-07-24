/// determine_biome(precipitation, temperature)
{
    var precipitation, temperature;
    precipitation = argument0;
    temperature = argument1;
    
    if(temperature > 0.0)
        return "manglar"
    else
        return "rainforest"
}
