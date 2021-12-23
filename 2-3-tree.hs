
-- B-Tree data structure
data BTree = BTLeaf [Int]
           | BTNode [(BTree, Int)] BTree
           deriving (Show)

emptyBTree = BTLeaf []

splitOverflown :: BTree -> (BTree, Int, BTree)
splitOverflown (BTLeaf xs) = (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n+1) xs))
  where n = (length xs) `div` 2

fixOverflow :: BTree -> BTree
fixOverflow (BTLeaf xs) = BTLeaf xs  -- incorrect stub

insert :: BTree -> Int -> BTree
insert (BTLeaf xs) x = fixOverflow (BTLeaf (x:xs))  -- incorrect stub
