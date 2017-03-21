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
        
        if let _ = dict[element] {
            return true
        }
        //if it didn't exist, we need to create an entry. The key is what matters here so we need to create a key that is the matching pair value and set the value to be the current element.
        else {
            dict[sum-element] = element
        }
    }
    return false
}

func sumCombinationTuple (array: [Int], sum: Int) -> (Int?, Int?) {
    var dict = [Int:Int]()
    var a, b: Int
    var returnEarly: Bool
    for element in array {
        // if we already have the current value set as a key in a dict entry, it means we already encountered the sum pair (which is the value of dict[element].
        
        if let _ = dict[element] {
            a = element
            b = dict[element]!
            return (a, b)
        }
        // else find the corresponding sum pair value and use that to be the key. We can look the key up on a further iteration to see if it exists. If it does, we've found a sum pair.
        else {
            dict[sum-element] = element
        }
    }
    return (nil, nil)
}

