-- record notation, with independent lists of keys and children
data Node = Node { keys     :: [Int]
                 , children :: [Maybe Node]  -- for root: maybe none; for leaf: always none
                 } deriving (Show)

-- the empty node
emptyNode = Node [] [Nothing]
