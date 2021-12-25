module BTree where

-- ==
-- ==   GENERIC UTILITY CODE
-- ==
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

-- ==
-- ==   SPECIFIC BTREE CODE
-- ==
-- a tree is either a leaf or a node
-- on both leaf and node is a list of keys
-- on both leaf and node, each key is associated with a value
-- on nodes, each key is associated with the subtree below the key
-- on nodes, there is an additional final subtree above all keys
data BTree key value
  = BTLeaf [(key, value)]
  | BTNode [(key, (value, BTree key value))] (BTree key value)
  deriving (Eq, Show)

--
-- development steps:
--   - insert, regardless of ordering and node size
--   - lookup
--   - preserve ordering
--   - cap leaf size (split leaf when too big)
--   - cap node size (split node when too big)

insert :: Ord key => BTree key value -> key -> value -> BTree key value
insert (BTLeaf leaf) key value = BTLeaf (putIntoList leaf key value)
insert _ _ _ = undefined

-- ==
-- ==   BTREE UTILITY CODE
-- ==
emptyBTree :: Ord key => BTree key value
emptyBTree = BTLeaf []

toList :: Ord key => BTree key value -> [(key, value)]
toList (BTLeaf []) = []
toList (BTLeaf ((key, value) : remainder)) = (key, value) : toList (BTLeaf remainder)
toList (BTNode [] finalSubtree) = toList finalSubtree
toList (BTNode ((key, (value, firstSubtree)) : remainder) finalSubtree) = toList firstSubtree ++ [(key, value)] ++ toList (BTNode remainder finalSubtree)

ofList :: Ord key => [(key, value)] -> BTree key value
ofList [] = emptyBTree
ofList ((key, value) : remainder) = insert (ofList remainder) key value
