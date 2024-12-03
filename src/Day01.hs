module Day01 (solve1, solve2) where

import Data.List (sort)

parseInput :: String -> ([Int], [Int])
parseInput input = unzip [(read a, read b) | [a,b] <- map words $ lines input]

getSortedNums :: String -> ([Int], [Int])
getSortedNums input = (sort as, sort bs) where (as, bs) = parseInput input

solve1 :: String -> Int
solve1 input = sum $ zipWith (\x y -> abs (x - y)) nums1 nums2 where (nums1, nums2) = getSortedNums input

solve2 :: String -> Int
solve2 input = sum $ map (\x -> x * length (filter (== x) nums2)) nums1 where (nums1, nums2) = getSortedNums input