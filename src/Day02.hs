module Day02 (solve1, solve2) where

import Data.Monoid (All(..))

parseReports :: String -> [[Int]]
parseReports = map (map read . words) . lines

checkAdjacent :: (Int -> Int -> Bool) -> [Int] -> Bool
checkAdjacent f report = and [f level1 level2 | (level1, level2) <- zip report (tail report)]

isIncreasing :: [Int] -> Bool
isIncreasing = checkAdjacent (<)

isDecreasing :: [Int] -> Bool
isDecreasing = checkAdjacent (>)

hasValidDiffs :: [Int] -> Bool
hasValidDiffs = checkAdjacent (\level1 level2 -> 1 <= abs (level1 - level2) && abs (level1 - level2) <= 3)

isMonotonic :: [Int] -> Bool
isMonotonic report = isIncreasing report || isDecreasing report

isValidReport :: [Int] -> Bool
isValidReport = getAll . foldMap (All .) predicates
    where predicates = [isMonotonic, hasValidDiffs]

removes :: [a] -> [[a]]
removes [] = []
removes (level:report) = report : map (level:) (removes report)

solve1 :: String -> Int
solve1 = length . filter isValidReport . parseReports

solve2 :: String -> Int
solve2 = length . filter (any isValidReport . removes) . parseReports