module Day02 (solve1, solve2) where

parseReports :: String -> [[Int]]
parseReports = map (map read . words) . lines

checkAdjacent :: (Int -> Int -> Bool) -> [Int] -> Bool
checkAdjacent f report = and [f level1 level2 | (level1, level2) <- zip report (tail report)]

isIncreasing = checkAdjacent (<)
isDecreasing = checkAdjacent (>)
hasValidDiffs = checkAdjacent (\level1 level2 -> 1 <= abs (level1 - level2) && abs (level1 - level2) <= 3)
isMonotonic = \report -> isIncreasing report || isDecreasing report

checkReport :: [Int] -> Bool
checkReport = \report -> isMonotonic report && hasValidDiffs report

removes :: [a] -> [[a]]
removes [] = []
removes (level:report) = report : map (level:) (removes report)

checkSkippableLevelsReport :: [Int] -> Bool
checkSkippableLevelsReport = any checkReport . removes

sumValidReports :: [[Int]] -> Int
sumValidReports = length . filter checkReport

sumValidSkippableReports :: [[Int]] -> Int
sumValidSkippableReports = length . filter checkSkippableLevelsReport

solve1 :: String -> Int
solve1 = sumValidReports . parseReports

solve2 :: String -> Int
solve2 = sumValidSkippableReports . parseReports