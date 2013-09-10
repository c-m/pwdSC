-- rewriting of password strength checker - lecture 10

module Main where

import Data.Char
import Control.Monad

-- |This is the main function (the center of all that it was, it is and will be).
-- This program checks whether a password is strong or not...
main :: IO()
main = do
	putStrLn "Please enter your password for verifying:"
	pass <- getLine
	check pass
	
	putStrLn "quit the program? y/n"
	ans <- getLine
	when (ans /= "y") $ do
		putStrLn "not quitting"
		main

-- |This is the check function.
-- It checks the strength of the input password.
check :: String -> IO()
check pwd
	 | (any (isNumber)  pwd
	 && any (isLower)  pwd
	 && any (isUpper)  pwd
	 && length pwd >= 15) = putStrLn "Your password looks quite strong! :) "
	 | otherwise = putStrLn "Your password may not be as strong as you think it is. :( "
		