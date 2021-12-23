-- record notation, with independent lists of keys and children
data Node = Node { keys     :: [Int]
                 , children :: [Maybe Node]
                 }
