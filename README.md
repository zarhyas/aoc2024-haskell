# aoc2024-haskell
Attempting [Advent of Code - 2024](https://adventofcode.com/2024) Edition with Haskell.

## Day 02

* `(.)` is function composition, `($)` is function application.
    * I think `(.)` is cleaner from a purely functional POV

* Strings in Haskell are a list of characters, how convenient! :3
```
ghci> :info String
type String = [Char]
```

* Okay, Haskell is getting uncontrollably more fun to learn (inspired from [How Monoids are useful in Programming](https://www.youtube.com/watch?v=BovTQeDK7XI&ab_channel=Tsoding))

    * Wrap a list of predicates into a single predicate, and check every single predicate (with disjunction or conjunction). Why? Well, now you can just add a predicate (`[Int] -> Bool`) and that's it!

    * `(->)` is a type in Haskell parametrized by two types (similar to how `Maybe` is parametrized by a type)! 

    * Why is `Bool` not a monoid though? Because first you would have to choose the operation - whether you want a disjunction or a conjunction.

    * In the `Data.Monoid` library, `Any` implements a disjunction monoid for the `Bool` type (`All` implements the conjunction).

    * We have `fold :: (Foldable t, Monoid m) => t m -> m`, and lists are foldable container! Now we can take a list of predicates and fold them into one monoid!

    * `fold . map` is so common in Haskell that there is a `foldMap` you can use directly

* When you define a record in Haskell, for each individual field, Haskell creates that is capable of extracting that value from that structure (this is why we use `getAll` to use proper the type)

* We'll use this information to make a cleaner solution for Day02!

## Day 03

