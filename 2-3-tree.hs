
-- B-Tree data structure

data BTree = BTLeaf [Int]
           | BTNode [(BTree, Int)] BTree
           deriving (Show)

emptyBTree = BTLeaf []

findInOrderedList :: [Int] -> Int -> Maybe Int
findInOrderedList [] _ = Nothing
findInOrderedList (x:xs) value | x < value  = findInOrderedList xs value
                               | x == value = Just value
                               | x > value  = Nothing

findKey :: BTree -> Int -> Maybe Int
findKey (BTLeaf xs) value = findInOrderedList xs value

splitOverflown :: BTree -> (BTree, Int, BTree)
splitOverflown (BTLeaf xs) = (BTLeaf (take n xs), xs !! n, BTLeaf (drop (n+1) xs))
  where n = (length xs) `div` 2

insertInRoot :: BTree -> Int -> BTree
insertInRoot (BTLeaf xs) x = BTLeaf (x:xs)  -- incorrect stub

insert :: BTree -> Int -> BTree
insert (BTLeaf xs) x = insertInRoot (BTLeaf xs) x
