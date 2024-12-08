module Day03 (solve1, solve2) where

import Data.Char (isDigit)

parseInput :: String -> [(Int, Int)]
parseInput [] = []
parseInput ('m':'u':'l':'(':rest) = 
    case span isDigit rest of
        (num1, ',':rest1) ->            
            case span isDigit rest1 of
                (num2, ')':rest2) ->
                    if not (null num1) && not (null num2)
                        then (read num1, read num2) : parseInput rest2
                        else parseInput rest2
                _ -> parseInput rest1
        _ -> parseInput rest
parseInput (_:rest) = parseInput rest

sumMulPairs :: [(Int, Int)] -> Int
sumMulPairs xs = sum [x * y | (x,y) <- xs]

solve1 :: String -> Int
solve1 = sumMulPairs . parseInput

solve2 :: String -> Int
solve2 = undefined