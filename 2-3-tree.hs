
-- B-Tree data structure
-- (does not enforce B-Tree invariants per se)
data BTree = BTLeaf [Int]
           | BTNode [(BTree, Int)] BTree
           deriving (Show)

emptyBTree = BTLeaf []
