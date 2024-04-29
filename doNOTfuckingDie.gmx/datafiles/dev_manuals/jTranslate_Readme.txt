Thank you for purchasing jTranslate! This guide will show you how to use the extension.


How to create a language file:

Before using any code, you must create a language file. For examples on how to do this, look at the included files "en.nat" and "es.nat". The language file must have an extension of ".nat" and be included in the project.

Example of a language file name: "fr.nat"

***IMPORTANT -> Remember to save your language file with UTF-8 encoding to make sure all acccents are imported into GameMaker properly.***

Example of a language file (from { to }):

{
     "I like dogs.": "Me gusta perros.",
     "He runs very fast.": "Corre muy rápido.",
     "Eggs are delicious.": "Huevos son delicioso."
}


How to add this to your project:

There are 3 simple scripts in jTranslate:
1. nat_set()
2. nat()
3. nat_destroy()

nat_set("lang") : Replace "lang" with whatever you named the language file (without the ".nat" extension). Call this before anything else.

Example: nat_set("en");
Output: Would set the language file to "en.nat" and import the language data.

nat("text") : Replace "text" with whatever you want to translate. You must add the translation to the language file before you can translate it.

Example: nat("I like dogs.");
Output: Would translate "I like dogs." to its translation in the language file (and return it as a string).

nat_destroy() : Destroys the ds_map used to store the language data. Use this at the end of the game or when you need to switch languages.

Example: nat_destroy();
Output: Would destroy the ds_map.


For any questions, please email chaserrx@gmail.com.