/// scr_send_score(url, key, name, score, category)
/// @param {str}     name            The name of the player
/// @param {real}     score            The achieved score
///
/// @description    Sends the player’s score to the database in Altervista
/// @date            2021-08-26
/// @copyright        Appsurd
{
    var _url, _key, _name, _score, _category, _nameEncoded, _categoryEncoded, args;
    _url = argument0;
    _key = argument1;
    _name = argument2;
    _score = argument3;
    _category = argument4;
    _nameEncoded = url_encode(base64_encode(string(_name)));
    _categoryEncoded = url_encode(base64_encode(string(_category)));
    
    var args =  "name="+_nameEncoded+
                "&score="+string(_score)+
                "&category="+_categoryEncoded+
                "&secret_key="+string(_key);
    
    return http_post_string(_url, args);
}
