
zip2 [x1] (x2:x2s)     = [(x1, x2)]
zip2 (x1:x1s) [x2]     = [(x1, x2)]
zip2 (x1:x1s) (x2:x2s) = [(x1, x2)] ++ (zip2 x1s x2s)
