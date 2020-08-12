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
    
    /*105. Construct Binary Tree from Preorder and Inorder Traversal
     Given preorder and inorder traversal of a tree, construct the binary tree.

     Note:
     You may assume that duplicates do not exist in the tree.

     For example, given

     preorder = [3,9,20,15,7]
     inorder = [9,3,15,20,7]
     Return the following binary tree:

     pre
     left: preorder[1 ... border]
     right: preorder[border + 1... length.count - 1]
     
     in
     left [0..<border]
     right[border+1 ...length.count - 1]
     
         3
        / \
       9  20
         /  \
        15   7
     */
    
    //方案1 通过操作数组实现，内存空间效率低
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if preorder.isEmpty || inorder.isEmpty {
           
            return nil
        }
        
        let rootNode = TreeNode.init(preorder.first!)
        var borderIndex: Int = 0
        
        for val in inorder {
            if val == rootNode.val {
                break;
            } else {
                borderIndex += 1
            }
        }
        
        
        if preorder.count > 1 && borderIndex != 0 {
            let leftNode = buildTree(Array(preorder[1...borderIndex]), Array(inorder[0..<borderIndex]))
            rootNode.left = leftNode
        }
        
        if inorder.count > borderIndex + 1 {
            let rightNode = buildTree(Array(preorder[(borderIndex+1)...(preorder.count-1)]), Array(inorder[(borderIndex+1)...(inorder.count-1)]))
            
            rootNode.right = rightNode
        }
        
        return rootNode
    }
    
    //方案2，通过操作下标处理，内存空间效率较高
    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildHelper(0, 0, inorder.count - 1, preorder, inorder)
    }
    
    func buildHelper(_ prestart: Int, _ instart: Int, _ inend: Int, _ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if prestart > preorder.count - 1 || instart > inend {
            return nil
        }
        
        let rootNode = TreeNode.init(preorder[prestart])
        var index = 0
        
        for i in instart...inend {
            if inorder[i] == rootNode.val {
                index = i
            }
        }
        
        let left = buildHelper(prestart + 1, instart, index - 1, preorder, inorder)
        
        // prestart - instart 操作意图为预防左边界为空情况做溢出处理
        let right = buildHelper( prestart - instart + index + 1 , index + 1, inend, preorder, inorder)
        rootNode.left = left
        rootNode.right = right
        
        return rootNode
        
    }
    
    
    /*
     106. Construct Binary Tree from Inorder and Postorder Traversal
     Given inorder and postorder traversal of a tree, construct the binary tree.

     Note:
     You may assume that duplicates do not exist in the tree.

     For example, given

     inorder = [9,3,15,20,7]
     postorder = [9,15,7,20,3]
     Return the following binary tree:

         3
        / \
       9  20
         /  \
        15   7
     
     */
    func buildIPTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return buildIPHelper(0, 0, postorder.count - 1, postorder.count - 1, inorder, postorder)
    }
    
    func buildIPHelper(_ inStart: Int, _ postStart: Int,  _ postEnd: Int, _ inEnd: Int, _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inStart > inEnd || postStart > postEnd || inEnd < 0 {
            return nil
        }
        
        var index: Int = 0
        let rootNode = TreeNode.init(postorder[postEnd])
        for i in inStart...inEnd {
            if inorder[i] == rootNode.val {
                index = i
            }
        }
        
        let mpostEnd: Int = postEnd - 1
        
        rootNode.left = buildIPHelper(inStart, postStart, index - 1, index - 1, inorder, postorder)
        rootNode.right = buildIPHelper(index + 1, index + 1, mpostEnd, inEnd, inorder, postorder)
        
        
        return rootNode
    }

}
