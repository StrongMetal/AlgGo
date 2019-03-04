//
//  AlgGoObject.swift
//  AlgGo
//
//  Created by 缪源 on 2019/2/28.
//  Copyright © 2019 oh. All rights reserved.
//

import Cocoa

class AlgGoObject: NSObject {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            assertionFailure("nums just got \(nums.count) element")
        }
        
        var tempMap = [Int: Int]()
        var count: Int = 0
        
        for num in nums {
            tempMap[num] = count
            count += 1
        }
        
        count = 0
        
        for value in nums {
            let temp = target - value
            if temp == value {
                count += 1
                continue
            }
            if tempMap.keys.contains(temp) {
                guard let lastCount: Int = tempMap[temp] else {continue }
                return [count, lastCount]
            }
            
            count += 1
        }
        
        assertionFailure("can't find prefer num")
        return []
    }
    
    

 
    
    //Add Two Numbers
    /*
    You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
    
    You may assume the two numbers do not contain any leading zero, except the number 0 itself.
    
    Example:
    
    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 0 -> 8
    Explanation: 342 + 465 = 807.
 */
    
    //    Definition for singly-linked list.
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        
        var carry: Int = 0
        let resultListNode: ListNode = ListNode.init(0)
        var current: ListNode = resultListNode
        
        
        while list1 != nil || list2 != nil {
            let list1Num: Int = list1?.val ?? 0
            let list2Num: Int = list2?.val ?? 0
            
            current.val = (list1Num + list2Num + carry) % 10
            carry = (list1Num + list2Num + carry) / 10

            if list1?.next != nil || list2 != nil {
                current.next = ListNode.init(carry)
                current = current.next!
            } else if carry > 0 {
                current.next = ListNode.init(carry)
                current = current.next!
            }
            
            if list1 != nil {
                list1 = list1?.next
            }
            
            if list2 != nil {
                list2 = list2?.next
            }
            
        }
        
        return resultListNode
    }
    
    
//    Longest Substring Without Repeating Characters
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var resultStr: String = String()
        var count: Int = 0
        
        for char in s {
            if resultStr.contains(char) {
                resultStr .append(char)
                let range =  resultStr.index(after: resultStr.firstIndex(of: char)!) ..< resultStr.endIndex
                resultStr = String(resultStr[range])
                
            } else {
                resultStr.append(char)
                if count < resultStr.count {
                    count = resultStr.count
                }
            }
        }
        
        return count
    }
    
    
    
    ///Median of Two Sorted Arrays
    /*
     There are two sorted arrays nums1 and nums2 of size m and n respectively.
     
     Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
     
     You may assume nums1 and nums2 cannot be both empty.
     */
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums1Count: Int = nums1.count;
        let nums2Count: Int = nums2.count;
        
        if (nums1Count + nums2Count) % 2 == 0 {
            
        } else {
            
        }
        
        return findMedianSortedArrays( nums1, nums2);
    }
    
}
