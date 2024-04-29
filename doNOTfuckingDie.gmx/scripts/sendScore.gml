/// sendScore(player name, score, category)
{
    var _obj, _player_name, _score, _category;
    _obj = instance_singleton(objHighscores);
    _player_name = argument0;
    _score = argument1;
    _category = argument2;
    
    with(_obj)
    {
        scr_send_score(addscore_url, key, _player_name, _score, _category);
    }
}
