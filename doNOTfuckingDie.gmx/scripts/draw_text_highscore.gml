/// @function draw_text_highscore(x,y,text1,text2,text3,highscores,name,colour)
/// @param {real}     x                Draw x position
/// @param {real}     y                Draw y position
/// @param {string} text1            The text to display above the index
/// @param {string} text2            The text to display above the name
/// @param {string} text3            The text to display above the score
/// @param {string} highscores        The highscores
/// @param {string} name            The name to colour
/// @param {colour} colour            The colour to give to the name
///
/// @description    Draws a highscore with the player’s name coloured in a special colour
/// @date            2021-08-26
/// @copyright        Appsurd
{
    var xx, yy, header_index, header_name, header_score, str, name, colour;
    xx = argument0;
    yy = argument1;
    header_index = argument2;
    header_name = argument3;
    header_score = argument4;
    str = argument5;
    name = argument6;
    colour = argument7;
    
    // Adjustable Parameters, if you need, you can change these values
    var max_la = 20;  // minimum width of the number column (1. 2. etc.)
    var max_lb = 100; // minimum width of the name column
    var max_lc = 20;  // minimum width of the score column

    // Initialise the drawing by splitting up the text
    var default_colour = draw_get_colour();
    var no_lines = string_count("|",str);
    var str2 = string_split_array("|",str,true);
    var str3,str3a,str3b,str3c;
    str3[0] = string(header_index)+".-"+string(header_name)+"-"+string(header_score);
    for(var i=0; i<no_lines; i+=1)
    {
        str3[i+1] = str2[i];
    }

    // Splitting up the text into a part with the number (str3a), the name (str3b) and the score (str3c)
    // The output from the database is given by (Nr.-Name-Score)
    for(var i=0; i<no_lines+1; i+=1)
    {
        var str4 = string_split_array("-",str3[i],false);
        str3a[i] = str4[0];
        str3b[i] = str4[1];
        str3c[i] = str4[2];

        // Decode the name so we can use it (but do not decode the header containing "name" since it's not encoded!)
        if (i != 0)
        {
            str3b[i] = base64_decode(str3b[i]);
        }

        // Assure that if a player has a \n in his name, then escape
        str3b[i] = string_replace_all(str3b[i],"\n","\\n");

        // Adjust the width such that the text doesn't overlap
        max_la = max(string_width(str3a[i]),max_la);
        max_lb = max(string_width(str3b[i]),max_lb);
        max_lc = max(string_width(str3c[i]),max_lc);
    }
    str3a[0] = "";

    // The actual drawing of the highscores
    var height = 0;
    for(var i=0; i<no_lines+1; i+=1)
    {
        // Colour the player's data
        if (name == str3b[i])
        {
            draw_set_colour(colour);
        }
        else
        {
            draw_set_colour(default_colour);
        }

        // Draw the numbers (1. 2. etc)
        draw_set_halign(fa_right);
        draw_text(xx+max_la+5,yy+height,str3a[i]);

        // Draw the name + score
        draw_set_halign(fa_left);
        draw_text(xx+max_la+10,yy+height,str3b[i]);
        draw_text(xx+max_la+10+max_lb+10,yy+height,str3c[i]);

        // Increment height
        height += string_height(str3[i]);
    }


}
