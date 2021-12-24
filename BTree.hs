module BTree where

--
data BTree key = BTLeaf [key]
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
splitOverflown :: Ord key => BTree key -> (BTree key, key, BTree key)
splitOverflown (BTLeaf xs) = (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n+1) xs))
  where n = length xs `div` 2
splitOverflown (BTNode _ _) = undefined

--
insertInRoot :: Ord key => BTree key -> key -> BTree key
insertInRoot (BTLeaf xs) x = BTLeaf (insertInOrderedList xs x) -- incorrect stub
insertInRoot (BTNode _ _) _ = undefined

--
insert :: Ord key => BTree key -> key -> BTree key
insert (BTLeaf xs) x = insertInRoot (BTLeaf xs) x
insert (BTNode _ _) _ = undefined
