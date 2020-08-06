//
//  BinaryTree.swift
//  AlgGo
//
//  Created by miaoy on 2020/8/5.
//  Copyright © 2020 oh. All rights reserved.
//

import Cocoa

class BinaryTree: NSObject {
    
    public class TreeNode {
        public var val: Int?
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = nil; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    /*  94. Binary Tree Inorder Traversal
    Given a binary tree, return the inorder traversal of its nodes' values.

    Example:

    Input: [1,null,2,3]
       1
        \
         2
        /
       3

    Output: [1,3,2]
    Follow up: Recursive solution is trivial, could you do it iteratively? */
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var resultNums = [Int]()
        var stack = [TreeNode]()
        var currentNode = root
        

         while currentNode != nil || !stack.isEmpty {
                //把根结点及所有左子节点放入栈中
                while currentNode != nil {
                    stack.append(currentNode!)
                    currentNode = currentNode?.left
                }
                
                currentNode = stack.popLast() ?? TreeNode.init()
                resultNums.append(currentNode?.val ?? 0)
                currentNode = currentNode?.right
        }
            
        return resultNums
    }
    
    /*
    102. Binary Tree Level Order Traversal medium
    
    Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

    For example:
    Given binary tree [3,9,20,null,null,15,7],
        3
       / \
      9  20
        /  \
       15   7
    return its level order traversal as:
    [
      [3],
      [9,20],
      [15,7]
    ]
    */
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if root == nil {
            return result
        }
        
        var stack = [TreeNode]()
        stack.append(root ?? TreeNode.init())
        
        while stack.count != 0 {
            var subResult = [Int]()
            var tempStack = [TreeNode]()
            for node in stack {
                subResult.append(node.val ?? 0)
                if node.left != nil {
                    tempStack.append(node.left!)
                }
                if node.right != nil {
                    tempStack.append(node.right!)
                }
            }
            stack = tempStack
            
            result.append(subResult)
            
        }
        
        return result
        
    }
    

}
