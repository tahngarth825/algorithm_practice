# Prompt

Today's challenge is about English.
We want you to write a program that converts Morse code to English text and English text to Morse code. You can choose your favorite programming language to solve the challenge.

As a rule, for every Morse sentence, we should consider a space between morse letters, and three spaces between morse words (" " => "   ") (also two spaces in english are equivalent to six spaces in morse ).

If the morse code that is going to be translated is not valid or the spacing is not correct, you should ouput 'Invalid Morse Code Or Spacing'.

INPUT
boolean    morseToEnglish
^^ true if the given input text is in morse and false if it is in english

string    textToTranslate
^^ a string containing the text we wish to translate

OUTPUT
string    translatedText
^^ a string containing the input text, translated

EXAMPLE
Input
false,"The wizard quickly jinxed the gnomes before they vaporized."

Output
- …. . .-- .. --.. .- .-. -.. --.- ..- .. -.-. -.- .-.. -.-- .--- .. -. -..- . -.. - …. . --. -. --- -- . … -… . ..-. --- .-. . - …. . -.-- …- .- .--. --- .-. .. --.. . -.. .-.-.-

CONSTRAINTS
0 < nrCharacters <= 100 000
