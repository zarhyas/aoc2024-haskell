module Main (main) where

import qualified Day01
import Utils (readInput)

main :: IO ()
main = do
    inputData <- readInput 1
    putStrLn $ "Day 1, Part 1: " ++ show (Day01.solve1 inputData)
    putStrLn $ "Day 1, Part 2: " ++ show (Day01.solve2 inputData)