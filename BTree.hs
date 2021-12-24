module BTree where

data BTree key = BTLeaf [key]
               | BTNode [((BTree key), Int)] (BTree key)
               deriving (Eq, Show)

emptyBTree :: Ord key => BTree key
emptyBTree = BTLeaf []

findInOrderedList :: Ord key => [key] -> key -> Maybe key
findInOrderedList [] _ = Nothing
findInOrderedList (x:xs) value | x < value  = findInOrderedList xs value
                               | x == value = Just value
                               | x > value  = Nothing

findKey :: Ord key => (BTree key) -> key -> Maybe key
findKey (BTLeaf xs) value = findInOrderedList xs value

splitOverflown :: Ord key => (BTree key) -> ((BTree key), key, (BTree key))
splitOverflown (BTLeaf xs) = (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n+1) xs))
  where n = (length xs) `div` 2

insertInRoot :: Ord key => (BTree key) -> key -> (BTree key)
insertInRoot (BTLeaf xs) x = BTLeaf (x:xs)  -- incorrect stub

insert :: Ord key => (BTree key) -> key -> (BTree key)
insert (BTLeaf xs) x = insertInRoot (BTLeaf xs) x
