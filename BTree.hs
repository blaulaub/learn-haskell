module BTree where

data BTree key = BTLeaf [key]
               | BTNode [((BTree key), key)] (BTree key)
               deriving (Eq, Show)

emptyBTree :: Ord key => BTree key
emptyBTree = BTLeaf []

findInOrderedList :: Ord key => [key] -> key -> Maybe key
findInOrderedList [] _ = Nothing
findInOrderedList (x:xs) value | x < value  = findInOrderedList xs value
                               | x == value = Just value
                               | x > value  = Nothing
findInOrderedList (_:_) _ = undefined

findKey :: Ord key => (BTree key) -> key -> Maybe key
findKey (BTLeaf xs) value = findInOrderedList xs value
findKey (BTNode _ _) _ = undefined

splitOverflown :: Ord key => (BTree key) -> ((BTree key), key, (BTree key))
splitOverflown (BTLeaf xs) = (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n+1) xs))
  where n = (length xs) `div` 2
splitOverflown (BTNode _ _) = undefined

insertInRoot :: Ord key => (BTree key) -> key -> (BTree key)
insertInRoot (BTLeaf xs) x = BTLeaf (x:xs)  -- incorrect stub
insertInRoot (BTNode _ _) _ = undefined

insert :: Ord key => (BTree key) -> key -> (BTree key)
insert (BTLeaf xs) x = insertInRoot (BTLeaf xs) x
insert (BTNode _ _) _ = undefined
