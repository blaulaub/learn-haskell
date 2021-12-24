module BTree where

--
data BTree key
  = BTLeaf [key]
  | BTNode [(BTree key, key)] (BTree key)
  deriving (Eq, Show)

--
emptyBTree :: Ord key => BTree key
emptyBTree = BTLeaf []
--
insertInOrderedList :: Ord key => [key] -> key -> [key]
insertInOrderedList [] value = [value]
insertInOrderedList (x : xs) value
  | x < value = x : insertInOrderedList xs value
  | x == value = value : xs
  | x > value = value : x : xs
insertInOrderedList (_ : _) _ = undefined

--
data BTSplitResult key
  = BTUnsplit (BTree key)
  | BTSplit (BTree key, key, BTree key)

--
splitIfOverflown :: Ord key => BTree key -> BTSplitResult key
splitIfOverflown (BTLeaf xs)
  | length xs > 2 = BTSplit (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n + 1) xs))
  | otherwise = BTUnsplit (BTLeaf xs)
  where
    n = length xs `div` 2
splitIfOverflown (BTNode ps p) = BTUnsplit (BTNode ps p) -- incorrect stub
--

rootFromSplit :: Ord key => BTSplitResult key -> BTree key
rootFromSplit (BTUnsplit tree) = tree
rootFromSplit (BTSplit (lower, key, upper)) = BTNode [(lower, key)] upper

--
insertInRoot :: Ord key => BTree key -> key -> BTree key
insertInRoot (BTLeaf xs) x = rootFromSplit (splitIfOverflown (BTLeaf (insertInOrderedList xs x))) -- incorrect stub
insertInRoot (BTNode [] p) x = undefined
insertInRoot (BTNode ps p) x = undefined

--
insert :: Ord key => BTree key -> key -> BTree key
insert (BTLeaf xs) x = insertInRoot (BTLeaf xs) x
insert (BTNode ps p) x = insertInRoot (BTNode ps p) x
