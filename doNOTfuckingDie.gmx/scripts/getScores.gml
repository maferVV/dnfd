/// getScores(lines to display, player name, category)
{
    var _obj, _no_lines, _player_name, _category;
    _obj = instance_singleton(objHighscores);
    _no_lines = argument0;
    _player_name = argument1;
    _category = argument2;
    
    with(_obj)
    {
        scoresAreLoaded = false;
        linesToDisplay = _no_lines;
        player_name = _player_name;
        category = _category;
        alarm[1] = 1;
    }
}
