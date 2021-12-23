
-- B-Tree data structure
data BTree = BTLeaf [Int]
           | BTNode [(BTree, Int)] BTree
           deriving (Show)

emptyBTree = BTLeaf []

insert :: BTree -> Int -> BTree
insert (BTLeaf xs) x = BTLeaf (x:xs)  -- incorrect stub
