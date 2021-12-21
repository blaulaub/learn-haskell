factorial n = product [1..n]
average ns = sum ns `div` length ns

a = b + c
 where
  b = 1
  c = 3

n = a `div` (length xs)
  where
    a = 10
    xs = [1..5]

last2 [x] = x
last2 (x:xs) = last2 xs

init2 [x] = []
init2 (x:xs) = x:(init2 xs)

init3 xs = reverse (drop 1 (reverse xs))
