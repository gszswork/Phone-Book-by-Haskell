# Phone-Book-by-Haskell
A Phone Book demo implemented by Haskell


## Problem Description:
Write a Haskell main function that repeatedly reads in and executes commands to implement a trivial phonebook program. The commands it should support are:

print           prints the entire phone book
add name num    adds num as the phone number for name
delete name            delete the entry for name
lookup name     print the entries that match name
quit            exit the program 

To keep things simple, only check the first letter of commands (so people can abbreviate commands to a single letter). You may assume that a name is a single word, and that it must match exactly. You can use the Haskell prelude function words to split a single string into a list of words. If you print a prompt and expect to read the command on the same line, you need to do hFlush stdout to ensure the prompt is written before reading the user command. To use this, you will need to import System.IO.
