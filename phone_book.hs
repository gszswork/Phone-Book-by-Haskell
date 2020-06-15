# Phone-Book-by-Haskell
-- COMP90048 DP WorkShop 10

--A Phonebook is a list of entries, each a pair of a name and a phone number

module Main where

import Data.Char (isDigit, digitToInt)
import System.IO (hFlush, stdout)

type Phonebook = [(String,String)]

main :: IO ()
main = phonebook []

phonebook :: Phonebook -> IO ()
phonebook pbook = do
    putStr "phonebook> "
    hFlush stdout
    command <- getLine
    case words command of
        [] -> phonebook pbook     -- empty command; just prompt again
        ((commandLetter:_):args) -> executeCommand pbook commandLetter args

executeCommand :: Phonebook -> Char -> [String] -> IO ()
executeCommand pbook 'p' [] =
    printPhonebook pbook >> phonebook pbook
executeCommand pbook 'a' [name,num] =
    phonebook $ pbook ++ [(name,num)] -- add to the end
executeCommand pbook 'd' [name] =
    phonebook $ filter ((/= name) . fst) pbook
executeCommand pbook 'l' [name] =
    printPhonebook (filter ((== name) . fst) pbook) >> phonebook pbook
executeCommand _ 'q' [] = return ()
executeCommand pbook 'h' [] = usage >> phonebook pbook
executeCommand pbook '?' [] = usage >> phonebook pbook
executeCommand pbook cmd _ = do
    putStrLn ("Unknown command letter '" ++ [cmd] ++ "'")
    usage
    phonebook pbook

printPhonebook :: Phonebook -> IO ()
printPhonebook = mapM_ (\(name,num) -> putStrLn $ name ++ " " ++ num)

--Not asked for in the spec, but this prints out a usage message:

usage :: IO ()
usage = putStrLn $ unlines $ [
        "Usage:",
        "    print           prints the entire phone book",
        "    add name num    adds num as the phone number for name",
        "    delete name     delete the entry for name",
        "    lookup name     print the entries that match name",
        "    quit            exit the program",
        "    help            display this usage message"]