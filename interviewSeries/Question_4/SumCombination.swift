//
//  SumCombination.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/10/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import Foundation

func sumCombination (array: [Int], sum: Int)->Bool {
    var dict = [Int:Int]()
    
    for element in array {
        //check to see if current element exists as a key entry. If it does, we already iterated over the matching value pair and added it to the dictionary.
        if let pairHalf = dict[element] {
            return true
        }
        //if it didn't exist, we need to create an entry. The key is what matters here so we need to create a key that is the matching pair value and set the value to be the current element.
        else {
            dict[sum-element] = element
        }
    }
    return false
}

