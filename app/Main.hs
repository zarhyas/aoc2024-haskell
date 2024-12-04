module Main (main) where

import qualified Day02
import Utils (readInput)

main :: IO ()
main = do
    inputData <- readInput 2
    putStrLn $ "Day 2, Part 1: " ++ show (Day02.solve1 inputData)
    putStrLn $ "Day 2, Part 2: " ++ show (Day02.solve2 inputData)