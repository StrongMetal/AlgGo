//
//  main.swift
//  AlgGo
//
//  Created by 缪源 on 2019/2/28.
//  Copyright © 2019 oh. All rights reserved.
//

import Foundation


//print("Hello, World!")
//
//let a = [3, 2 ,4]
//let b = [1]
//
//let obj = AlgGoObject()
//let sumArr = obj.twoSum(a, 6)
//
//print(sumArr)
//
//
//let testedString: String = "pwwkew"
//let longestInt = obj.lengthOfLongestSubstring(testedString)
//
//print(longestInt)


let arrObject = ArraySets()
//let resultArr = arrObject.sortedSquares([-8, -1, 0, 3, 10])

//let resultArr = arrObject.sortArrayByParity([1, 2, 3, 4])

//let resultArr = arrObject.flipAndInvertImage([[0, 1, 0], [0, 0, 1], [1, 0, 0]])

//let resultArr = arrObject.commonChars(["ffllif", "filflf", "fffille"])

//let resultArr = arrObject.arrayPairSum([1, 4, 3, 5, 7, 9])
//A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]
//let resultArr = arrObject.sumEvenAfterQueries([1,2,3,4], [[1,0],[-3,1],[-4,0],[2,3]])

//let resultArr = arrObject.sortArrayByParityII([4,2,5,7,6,9])

//let resultArr = arrObject.fib(10)
//let resultArr = arrObject.transpose([[1,2,3],[4,5,6],[7,8,9]])
//let resultArr = arrObject.isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]])
//let resultArr = arrObject.isToeplitzMatrix([[11,74,0,93],
//                                            [40,11,74,7]])

//let result = arrObject.findDisappearedNumbers(
//    [4, 3, 2, 7, 8, 2, 3, 1])
//let result = arrObject.maxProfit([7,1,5,3,6,4])



//medium
//let mediumSets = ArrayMediumSets()
//let result = mediumSets.deckRevealedIncreasing([17,13,11,2,3,5,7])

//print(result)


let treeNodeAlg = BinaryTree()


let treeNode0 = BinaryTree.TreeNode.init(3)
let treeNode1 = BinaryTree.TreeNode.init(4)
let treeNode2 = BinaryTree.TreeNode.init(5)
//let treeNode3 = BinaryTree.TreeNode.init(value:6)
let treeNode4 = BinaryTree.TreeNode.init(7)
let treeNode5 = BinaryTree.TreeNode.init(8)
let treeNode6 = BinaryTree.TreeNode.init(9)
let treeNode7 = BinaryTree.TreeNode.init(10)

treeNode4.left = treeNode1
treeNode4.right = treeNode6
treeNode1.left = treeNode0
treeNode1.right = treeNode2
treeNode6.left = treeNode5
treeNode6.right = treeNode7

//94. Binary Tree Inorder Traversal
//let result = treeNodeAlg.inorderTraversal(nil)
//print(result)


//102. Binary Tree Level Order Traversal medium
let result = treeNodeAlg.levelOrder(nil)
    //print(result)


/*105. Construct Binary Tree from Preorder and Inorder Traversal */

//let preorder = [3,9,20,15,7]
//let inorder = [9,3,15,20,7]
//let preorder = [1,2]
//let inorder = [1,2]
let preorder = [1,2,3]
let inorder = [2,3,1]

let output = treeNodeAlg.buildTree1(preorder, inorder)
//print(treeNodeAlg.levelOrder(output))

/*106. Construct Binary Tree from Inorder and Postorder Traversal*/

let inorder1 = [9,3,15,20,7]
let postorder = [9,15,7,20,3]

let output1 = treeNodeAlg.buildIPHelper(0, 0, postorder.count - 1, inorder1.count - 1, inorder1, postorder);
print(treeNodeAlg.levelOrder(output1))
