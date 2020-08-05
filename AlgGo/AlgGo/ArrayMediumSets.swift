//
//  ArrayMediumSets.swift
//  AlgGo
//
//  Created by miaoy on 2019/3/8.
//  Copyright © 2019 oh. All rights reserved.
//

import Cocoa

class ArrayMediumSets: NSObject {
    /* 950. Reveal Cards In Increasing Order
     In a deck of cards, every card has a unique integer.  You can order the deck in any order you want.
     
     Initially, all the cards start face down (unrevealed) in one deck.
     
     Now, you do the following steps repeatedly, until all cards are revealed:
     
     Take the top card of the deck, reveal it, and take it out of the deck.
     If there are still cards in the deck, put the next top card of the deck at the bottom of the deck.
     If there are still unrevealed cards, go back to step 1.  Otherwise, stop.
     Return an ordering of the deck that would reveal the cards in increasing order.
     
     The first entry in the answer is considered to be the top of the deck.
     
     Example 1:
     Input: [17,13,11,2,3,5,7]
     Output: [2,13,3,11,5,17,7]
     Explanation:
     We get the deck in the order [17,13,11,2,3,5,7] (this order doesn't matter), and reorder it.
     After reordering, the deck starts as [2,13,3,11,5,17,7], where 2 is the top of the deck.
     We reveal 2, and move 13 to the bottom.  The deck is now [3,11,5,17,7,13].
     We reveal 3, and move 11 to the bottom.  The deck is now [5,17,7,13,11].
     We reveal 5, and move 17 to the bottom.  The deck is now [7,13,11,17].
     We reveal 7, and move 13 to the bottom.  The deck is now [11,17,13].
     We reveal 11, and move 17 to the bottom.  The deck is now [13,17].
     We reveal 13, and move 17 to the bottom.  The deck is now [17].
     We reveal 17.
     Since all the cards revealed are in increasing order, the answer is correct.
     */
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var increasingDeck = deck.sorted()
        let count = deck.count
        if count <= 2 {
            return increasingDeck
        }
        
        var result = [Int]()
        result.append(increasingDeck[count - 2])
        result.append(increasingDeck[count - 1])
        for index in stride(from: increasingDeck.count - 3, through: 0, by: -1) {
            result.insert(result.last!, at: 0)
            result.remove(at: result.count - 1)
            result.insert(increasingDeck[index], at: 0)
        }
        
        return result
    }
    
    /*442. Find All Duplicates in an Array
     Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
     
     Find all the elements that appear twice in this array.
     
     Could you do it without extra space and in O(n) runtime?
     
     Example:
     Input:
     [4,3,2,7,8,2,3,1]
     
     Output:
     [2,3]
     */
    
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        for index in 0..<nums.count - 1 {
            let i = abs(nums[index]) - 1
            if nums[i] < 0 {
                result.append(i + 1)
            }
            nums[i] = -nums[i]
        }
        return [1]
    }

}
