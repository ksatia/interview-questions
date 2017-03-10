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
        var key = sum-element
        dict[element] = element
        for value in dict.keys {
            if dict[value] == key {
                return true
            }
        }
    }
    return false
}

