
even2 :: Integral a => a -> Bool
even2 n = n `mod` 2 == 0

splitAt2 :: Int -> [a] -> ([a],[a])
splitAt2 n xs = (take n xs, drop n xs)

recip2 :: Fractional a => a -> a
recip2 n = 1/n

abs2 :: (Num n, Ord n) => n -> n
abs2 n = if n >= 0 then n else -n

abs3 :: (Num n, Ord n) => n -> n
abs3 n | n >= 0    =  n
       | otherwise = -n

signum2 :: (Num n, Ord n) => n -> n
signum2 n = if n > 0 then 1 else
              if n < 0 then -1 else 0

signum3 :: (Num n, Ord n) => n -> n
signum3 n | n < 0     = -1
          | n > 0     =  1
          | otherwise =  0

not2 :: Bool -> Bool
not2 False = True
not2 True  = False

and2 :: Bool -> Bool -> Bool
and2 True  True  = True
and2 True  False = False
and2 False True  = False
and2 False False = False

and3 :: Bool -> Bool -> Bool
and3 True  b = b
and3 False _ = False

add2 :: (Num a) =>  a -> a -> a
add2 = \x -> (\y -> x+y)

odds2 :: (Num a, Enum a) => a -> [a]
odds2 = \n -> map (\x -> 2*x+1) [1..n]

-- this fails, types are inconsistent
--odds3 :: (Num a, Enum a, Num b) => a -> [b]

apply2 :: Num a => (a -> a) -> a -> a
apply2 = \f -> \v -> f v

-- this fails, minus is parsed as part of 5
--apply (-5) 10
-- this passes, minus is an operator
--apply((-)5) 10

halve2 :: [a] -> ([a], [a])
halve2 [] = ([],[])
halve2 (x:xs) = (x:bs, cs ++ [c])
  where
    c = last xs
    (bs, cs) = halve2 (init xs)

third2 :: [a] -> a ; third2 xs = head (tail (tail xs))
third3 :: [a] -> a ; third3 xs = xs !! 2
third4 :: [a] -> a ; third4 (_:_:x:_) = x
