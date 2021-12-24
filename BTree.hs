module BTree where

-- put key-value pairs into a list, keeping keys unique and ordered
putIntoList :: Ord key => [(key, value)] -> key -> value -> [(key, value)]
putIntoList [] key value = [(key, value)]
putIntoList ((thisKey, thisValue) : kvps) newKey newValue
  | thisKey < newKey = (thisKey, thisValue) : putIntoList kvps newKey newValue
  | thisKey == newKey = (thisKey, newValue) : putIntoList kvps newKey newValue
  | otherwise = (thisKey, thisValue) : (newKey, newValue) : kvps

-- if list is beyond capacity, split into lower, pivot and upper
data SplitResult a
  = Unsplit [a] -- original data, marked as Unsplit
  | Split [a] a [a] -- lower, pivot, and upper, marked as Split
split :: Int -> [a] -> SplitResult a
split capacity xs
  | length xs <= capacity = Unsplit xs
  | otherwise = Split (take n xs) (xs !! n) (drop (n+1) xs)
  where n = length xs `div` 2

-- a tree is either a leaf or a node
-- on both leaf and node is a list of keys
-- on both leaf and node, each key is associated with a value
-- on nodes, each key is associated with the subtree below the key
-- on nodes, there is an additional final subtree above all keys
data BTree key value
  = BTLeaf [(key, value)]
  | BTNode [(key, (value, BTree key value))] (BTree key value)
  deriving (Eq, Show)

-- insert at the root, return the updated root
put1 :: Ord key => BTree key value -> key -> value -> BTree key value
-- insert at the child of the parent, return the updated parent
put2 :: Ord key => BTree key value -> BTree key value -> key -> value -> BTree key value

put1 (BTLeaf root) key value = undefined
put1 (BTNode rs rt) key value = undefined
put2 (BTLeaf _) _ _ _ = undefined -- unreachable
put2 (BTNode ps pt) (BTNode cs ct) key value = undefined
put2 (BTNode ps pt) (BTLeaf leaf) key value = undefined

--
emptyBTree :: Ord key => BTree key value
emptyBTree = BTLeaf []
