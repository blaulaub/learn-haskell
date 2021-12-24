#!/usr/bin/runhaskell

import Test.HUnit
import qualified BTree

--
-- assertNotEqual not provided by HUnit
--
assertNotEqual :: (Eq a, Show a) => String -> a -> a -> Assertion
assertNotEqual preface expected actual =
  assertBool msg (actual /= expected)
 where msg = (if null preface then "" else preface ++ "\n") ++
             "not expected: " ++ show expected ++ "\n but got: " ++ show actual

--
treeOf :: Ord key => [key] -> BTree.BTree key
treeOf [] = BTree.emptyBTree
treeOf (x : xs) = BTree.insert (treeOf xs) x

--
main = runTestTT (TestList [

  TestLabel "constant for empty B-tree is well defined"
    (TestCase (assertEqual "emptyBTree is a leaf with no data" (BTree.BTLeaf []) (BTree.emptyBTree :: BTree.BTree Int))),

  TestLabel "constant for empty B-tree is well comparable"
    (TestCase (assertNotEqual "emptyBTree is not a leaf with one data item" (BTree.BTLeaf [42]) BTree.emptyBTree)),

  TestLabel "insert one element into empty tree gives one-leaf one-element tree"
    (TestCase (assertEqual "leaf consists of inserted key" (BTree.BTLeaf [13]) (BTree.insert BTree.emptyBTree 13))),

  TestLabel "insert two descending elements into empty tree gives ordered one-leaf tree"
    (TestCase (assertEqual "leaf consists of inserted key" (BTree.BTLeaf [16, 27]) (BTree.insert (treeOf [27]) 16))),

  TestLabel "insert two ascending elements into empty tree gives ordered one-leaf tree"
    (TestCase (assertEqual "leaf consists of inserted key" (BTree.BTLeaf [1, 23]) (BTree.insert (treeOf [1]) 23)))

  ])
