
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

odds3 :: (Num a, Enum a, Num b) => a -> [b]
odds3 = \n -> map (\x -> 2*x+1) [1..n]
