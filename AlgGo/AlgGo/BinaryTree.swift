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
        public var value : Float?
        public var leftNode : TreeNode?
        public var rightNode : TreeNode?
        public init() {
            self.value = nil; self.leftNode = nil; self.rightNode = nil;
        }
        
        public init(value: Float) {
            self.value = value; self.leftNode = nil; self.rightNode = nil;
        }
        
        public init(value: Float, leftNode: TreeNode, rightNode: TreeNode ) {
            self.value = value
            self.leftNode = leftNode
            self.rightNode = rightNode
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
    
    func inorderTraversal(treeNode: TreeNode?) -> [Float] {
        if treeNode == nil {
            assertionFailure("Null can't be tranvalersal inorder")
            return []
        }
        
        var resultNums = [Float]()
        var stack = [TreeNode]()
        var currentNode = treeNode
        
        while currentNode != nil || !stack.isEmpty {
            while currentNode != nil {
                stack.append(currentNode)
                currentNode = currentNode.leftNode ?? TreeNode.init()
            }
            
            currentNode = stack.popLast() ?? TreeNode.init()
            resultNums.append(currentNode.value ?? 0)
            currentNode = currentNode.rightNode ?? TreeNode.init()
        }
        
        return resultNums
    }
    
    
    
    

}
