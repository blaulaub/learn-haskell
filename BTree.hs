module BTree where

data BTree key value
  = BTLeaf [(key, value)]
  | BTNode [(BTree key value, (key, value))] (BTree key value)
  deriving (Eq, Show)

emptyBTree :: Ord key => BTree key value
emptyBTree = BTLeaf []

insert :: Ord key => BTree key value -> (key, value) -> BTree key value
insert _ _ = undefined
