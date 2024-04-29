/// scr_get_scores(url, key, name, no. of lines, category)
/// @param {str}     name            The name of the player
/// @param {real}     no_lines        The number of scores you want to display (generally 10 is fine)
///
/// @description    Get the highscore list from the database in Altervista
/// @date            2021-08-26
/// @copyright        Appsurd
{
    var _url, _key, _name, _no_lines, _category, _args, _nameEncoded, _categoryEncoded;
    _url = argument0;
    _key = argument1;
    _name = argument2;
    _no_lines = argument3;
    _category = argument4;
    _nameEncoded = url_encode(base64_encode(string(_name)));
    _categoryEncoded = url_encode(base64_encode(string(_category)));
    _args = "name="+_nameEncoded+
            "&no_lines="+string(_no_lines)+
            "&category="+_categoryEncoded+
            "&secret_key="+string(_key);
    get_highscores = http_post_string(_url, _args);
    return get_highscores;
}
