//
//  main.swift
//  AlgGo
//
//  Created by 缪源 on 2019/2/28.
//  Copyright © 2019 oh. All rights reserved.
//

import Foundation


print("Hello, World!")

let a = [3, 2 ,4]
let b = [1]

let obj = AlgGoObject()
let sumArr = obj.twoSum(a, 6)

print(sumArr)


let testedString: String = "pwwkew"
let longestInt = obj.lengthOfLongestSubstring(testedString)

print(longestInt)

