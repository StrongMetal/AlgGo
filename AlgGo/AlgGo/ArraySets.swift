//
//  ArraySets.swift
//  AlgGo
//
//  Created by miaoy on 2019/3/5.
//  Copyright © 2019 oh. All rights reserved.
//

import Cocoa

class ArraySets: NSObject {
    
    /*
     Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.
     Example 1:
     
     Input: [-4,-1,0,3,10]
     Output: [0,1,9,16,100]
     Example 2:
     
     Input: [-7,-3,2,3,11]
     Output: [4,9,9,49,121]
    */
    
    func sortedSquares(_ A: [Int]) -> [Int] {
        var counter: Int = 0
        var result = [Int]()
        counter = 0
        for value in A {
            result.append(abs(value) * abs(value))
            counter += 1
        }
        result = result.sorted()
        
        return result
    }

    /*
     Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.
     
     You may return any answer array that satisfies this condition.
     
     
     
     Example 1:
     
     Input: [3,1,2,4]
     Output: [2,4,3,1]
     The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
     
     
     Note:
     
     1 <= A.length <= 5000
     0 <= A[i] <= 5000

     */
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var oddArr = [Int]()
        var evenArr = [Int]()
        
        for num in A {
            if num % 2 == 0 {
                evenArr.append(num)
            } else {
                oddArr.append(num)
            }
        }
        evenArr.append(contentsOf: oddArr)
        return evenArr
    }
    
    /*
     Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.
     
     To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].
     
     To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].
     
     Example 1:
     
     Input: [[1,1,0],[1,0,1],[0,0,0]]
     Output: [[1,0,0],[0,1,0],[1,1,1]]
     Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
     Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
     Example 2:
     
     Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
     Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
     Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
     Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
     Notes:
     
     1 <= A.length = A[0].length <= 20
     0 <= A[i][j] <= 1

    */
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var resultArr = [[Int]]()
        var reverseArray = [Int]()
        
        for reverseArr in A {
            
            var childResultArr = [Int]()
            
            reverseArray = reverseArr.reversed()
            for num in reverseArray {
                if num == 0 {
                    childResultArr.append(1)
                } else {
                    childResultArr.append(0)
                }
                
            }
            resultArr.append(childResultArr)
        }
        
        return resultArr
    }
    
    /*
     Given an array A of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.
     
     You may return the answer in any order.
     
     
     
     Example 1:
     
     Input: ["bella","label","roller"]
     Output: ["e","l","l"]
     Example 2:
     
     Input: ["cool","lock","cook"]
     Output: ["c","o"]
    
    */
    
    func commonChars(_ A: [String]) -> [String] {
        var repeatCount: [Int] = Array.init(repeating: 0, count: 26)
        var outPutString = [String]()
        let aChar: String = "a"
        
        var count: Int = 0
        for eachString in A {
            var onceCount: [Int] = Array.init(repeating: 0, count: 26)
            for char in eachString {
                let acharNUm: Int = aChar.transInToAcsIIInt()
                let charNUm: Int = String(char).transInToAcsIIInt()
                let counter: Int = charNUm - acharNUm
                if count == 0 {
                    repeatCount[counter] += 1
                } else {
                    onceCount[counter] += 1
                }
            }
            for index in 0..<26 {
                if count != 0 {
                    repeatCount[index] = min(repeatCount[index], onceCount[index])
                }
            }
            count += 1
        }
        
        count = 0
        for eachNum in repeatCount {
            for _ in 0..<eachNum {
                outPutString.append(String(Character(UnicodeScalar(aChar.transInToAcsIIInt() + count)!)))
            }
            count += 1
        }
        
        return outPutString;
    }
    
    
    /* 561. Array Partition I
     Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
     
     Example 1:
     Input: [1,4,3,2]
     
     Output: 4
     Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
     Note:
     n is a positive integer, which is in the range of [1, 10000].
     All the integers in the array will be in the range of [-10000, 10000].
     */
    
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sortNums = nums.sorted()
        var count = sortNums.count
        var result: Int = 0
        if sortNums.count % 2 == 0 {
            while count > 0 {
                result += min(sortNums[count - 1], sortNums[count - 2])
                count -= 2
            }
            return result
        } else {
            return 0
        }
    }
    
    /*
     We have an array A of integers, and an array queries of queries.
     
     For the i-th query val = queries[i][0], index = queries[i][1], we add val to A[index].  Then, the answer to the i-th query is the sum of the even values of A.
     
     (Here, the given index = queries[i][1] is a 0-based index, and each query permanently modifies the array A.)
     
     Return the answer to all queries.  Your answer array should have answer[i] as the answer to the i-th query.
     
     
     
     Example 1:
     
     Input: A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]
     Output: [8,6,2,4]
     Explanation:
     At the beginning, the array is [1,2,3,4].
     After adding 1 to A[0], the array is [2,2,3,4], and the sum of even values is 2 + 2 + 4 = 8.
     After adding -3 to A[1], the array is [2,-1,3,4], and the sum of even values is 2 + 4 = 6.
     After adding -4 to A[0], the array is [-2,-1,3,4], and the sum of even values is -2 + 4 = 2.
     After adding 2 to A[3], the array is [-2,-1,3,6], and the sum of even values is -2 + 6 = 4.

     */
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var oriA = A
        var resultA = [Int]()
        var sum: Int = 0
        
        for num in oriA {
            if num % 2 == 0 {
                sum += num
            }
        }
        
        for indexArr in queries {
            guard let index = indexArr.last else {return [0]}
            guard let value = indexArr.first else {return [0]}
            //先移，再自加，符合条件再加
            if oriA[index]%2 == 0 {
                sum -= oriA[index]
            }
                oriA[index] += value
            
            if oriA[index]%2 == 0 {
                sum += oriA[index]
            }
            resultA.append(sum)
        }
        return resultA
    }
    
    
    
    /// 922. Sort Array By Parity II
    /*
     Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.
     
     Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.
     
     You may return any answer array that satisfies this condition.
     Example 1:
     
     Input: [4,2,5,7]
     Output: [4,5,2,7]
     */
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var evenCount = 0
        var oddCount = 1
        let count = A.count
        var result = Array.init(repeating: 0, count: count)
        
        for index in 0..<count {
            if A[index]%2 == 0 {
                result[evenCount] = A[index]
                evenCount += 2
            } else {
                result[oddCount] = A[index]
                oddCount += 2
            }
        }
        
        return result
    }
    
    /*
     509. Fibonacci Number
    The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
    
    F(0) = 0,   F(1) = 1
    F(N) = F(N - 1) + F(N - 2), for N > 1.
    Given N, calculate F(N).
    
    
    
    Example 1:
    
    Input: 2
    Output: 1
    Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
    */
    
    func fib(_ N: Int) -> Int {
        if N <= 1 {
            return N
        }
        var a = 0
        var b = 1
        var sum = 0
        var counter = 2
        while counter <= N {
            sum = a + b
            a = b
            b = sum
            counter += 1
        }
        
        return sum
    }
    
    /*867. Transpose Matrix
     Given a matrix A, return the transpose of A.
     
     The transpose of a matrix is the matrix flipped over it's main diagonal, switching the row and column indices of the matrix.
     
     
     
     Example 1:
     
     Input: [[1,2,3],[4,5,6],[7,8,9]]
     Output: [[1,4,7],[2,5,8],[3,6,9]]
     Example 2:
     
     Input: [[1,2,3],[4,5,6]]
     Output: [[1,4],[2,5],[3,6]]
     */
    
    func transpose(_ A: [[Int]]) -> [[Int]] {
        var arrr = A
        var resutl = [[Int]]()
        
        for layer in 0..<arrr[0].count {
            var layerArr = [Int]()
            for index in  0..<arrr.count {
                layerArr.append(arrr[index][layer])
            }
            resutl.append(layerArr)
        }
        
        return resutl
    }
    
    
    /*766. Toeplitz Matrix
     A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
     Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
     Example 1:
     
     Input:
     matrix = [
     [1,2,3,4],
     [5,1,2,3],
     [9,5,1,2]
     ]
     Output: True
     Explanation:
     In the above grid, the diagonals are:
     "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
     In each diagonal all elements are the same, so the answer is True.
     Example 2:
     
     Input:
     matrix = [
     [1,2],
     [2,2]
     ]
     Output: False
     Explanation:
     The diagonal "[1, 2]" has different elements.
     */
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        var matrixTemp = matrix
        let row = matrix.count
        guard let columnOnce = matrix.first else {return false}
        let column = columnOnce.count
        
        for rowIndex in 0..<row-1 {
            for colunmIndex in 0..<column-1 {
                if matrixTemp[rowIndex][colunmIndex] == matrixTemp[rowIndex+1][colunmIndex+1] {
                } else {
                    return false
                }
            }
        }
        return true;
    }
    
    /* 976. Largest Perimeter Triangle
     Given an array A of positive lengths, return the largest perimeter of a triangle with non-zero area, formed from 3 of these lengths.
     
     If it is impossible to form any triangle of non-zero area, return 0.
     Example 1:
     
     Input: [2,1,2]
     Output: 5
     Example 2:
     
     Input: [1,2,1]
     Output: 0
     Example 3:
     
     Input: [3,2,3,4]
     Output: 10
     */
    func largestPerimeter(_ A: [Int]) -> Int {
        var tempA = A
        tempA = tempA.sorted()
        for index in stride(from: tempA.count - 1, through: 2, by: -1) {
            if tempA[index] < tempA[index - 1] + tempA[index - 2] {
                return tempA[index] + tempA[index - 1] + tempA[index - 2]
            }
        }
        
        return 0
    }
    
    
    /* 888. Fair Candy Swap
     Alice and Bob have candy bars of different sizes: A[i] is the size of the i-th bar of candy that Alice has, and B[j] is the size of the j-th bar of candy that Bob has.
     
     Since they are friends, they would like to exchange one candy bar each so that after the exchange, they both have the same total amount of candy.  (The total amount of candy a person has is the sum of the sizes of candy bars they have.)
     
     Return an integer array ans where ans[0] is the size of the candy bar that Alice must exchange, and ans[1] is the size of the candy bar that Bob must exchange.
     
     If there are multiple answers, you may return any one of them.  It is guaranteed an answer exists.
     
     Example 1:
     Input: A = [1,1], B = [2,2]
     Output: [1,2]
     Example 2:
     Input: A = [1,2], B = [2,3]
     Output: [1,2]
     Example 3:
     Input: A = [2], B = [1,3]
     Output: [2,3]
     Example 4:
     Input: A = [1,2,5], B = [2,4]
     Output: [5,4]
     */
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        
        return [1]
    }
    
    /*An array is monotonic if it is either monotone increasing or monotone decreasing.
     
     An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].
     
     Return true if and only if the given array A is monotonic.*/
    func isMonotonic(_ A: [Int]) -> Bool {
        if A.count == 0 {return false}
        var counter1: Int = 0;
        var counter2: Int = 0
        for index in 0..<A.count-1 {
            if A[index] <= A[index + 1] {counter1 += 1}
            if A[index] >= A[index + 1] {counter2 += 1}
        }
        if counter1 == A.count-1 || counter2 == A.count-1 {return true}
        else {return false}
    }
    
    /*169. Majority Element  -摩尔投票法： https://www.zhihu.com/question/49973163/answer/235921864
     Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
     
     You may assume that the array is non-empty and the majority element always exist in the array.
     
     Example 1:
     
     Input: [3,2,3]
     Output: 3
     Example 2:
     
     Input: [2,2,1,1,1,2,2]
     Output: 2
     */
     func majorityElement(_ nums: [Int]) -> Int {
        var major: Int = nums.first!;
        var count: Int = 0
        for num in nums {
            if count == 0 {
                major = num
                count += 1
            } else if num == major {
                count += 1
            } else {
                count -= 1
            }
        }
        return major;
    }
    
    /* 448. Find All Numbers Disappeared in an Array
     Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
     
     Find all the elements of [1, n] inclusive that do not appear in this array.
     
     Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
     
     Example:
     
     Input:
     [4,3,2,7,8,2,3,1]
     
     Output:
     [5,6]
     */
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
//        List<Integer> ret = new ArrayList<Integer>();
//        
//        for(int i = 0; i < nums.length; i++) {
//            int val = Math.abs(nums[i]) - 1;
//            if(nums[val] > 0) {
//                nums[val] = -nums[val];
//            }
//        }
//
//        for(int i = 0; i < nums.length; i++) {
//            if(nums[i] > 0) {
//                ret.add(i+1);
//            }
//        }
//        return ret;
        
        var result = [Int]()
        var tempNums = nums
        
        for index in 0..<nums.count {
            let value = abs(tempNums[index]) - 1
            if tempNums[value] > 0 {
                tempNums[value] = -tempNums[value]
            }
        }
        
        for index in 0..<tempNums.count {
            if tempNums[index] > 0{
                result.append(index + 1)
            }
        }
        
        return result
    }
}


extension String {
    func transInToAcsIIInt() -> Int {
        var acharNUm: Int = 0
        for num in self.unicodeScalars {
            acharNUm = Int(num.value)
        }
        
        return acharNUm
    }
}
