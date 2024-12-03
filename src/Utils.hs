module Utils where

readInput :: Int -> IO String
readInput day = readFile $ "inputs/day" ++ (if day < 10 then "0" else "") ++ show day ++ ".txt"
