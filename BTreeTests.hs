#!/usr/bin/runhaskell

import Test.HUnit
import qualified BTree
import GHC.IO.Handle.Types (Handle__ (Handle__))

--
-- assertNotEqual not provided by HUnit
--
assertNotEqual :: (Eq a, Show a) => String -> a -> a -> Assertion
assertNotEqual preface expected actual =
  assertBool msg (actual /= expected)
 where msg = (if null preface then "" else preface ++ "\n") ++
             "not expected: " ++ show expected ++ "\n but got: " ++ show actual
--
main :: IO Counts
main = runTestTT (TestList [
  --
  TestLabel
    "constant for empty B-tree is an empty leaf"
    (TestCase (assertEqual "emptyBTree is a leaf with no data" (BTree.BTLeaf []) (BTree.emptyBTree :: BTree.BTree Int Int)))
  ])

--
-- TestLabel "building tree from four elements gives ordered one-leaf tree"
--  (TestCase (assertEqual "leaf consists of inserted key" [23, 34, 54, 76] (listFrom (treeOf [54, 23, 76, 34]))))
