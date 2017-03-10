//
//  FlattenFunction.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/3/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import Foundation


func flatten (input: [Any]) -> [Any] {
    
    var outputArray = [Any] ()
    
    for i in 0..<input.count {
        let data = input[i]
        (data is [Any]) ?
            outputArray += flatten(input: data as! [Any]) :
            outputArray.append(data)
    }
    
    
    /*for element in input {
        if let sublist = element as? [Any] {
            outputArray.append(contentsOf: flatten(input: sublist))
        } else {
            outputArray.append(element)
        }
    }*/
    
    
    
    /*
    //Using this method we can remove the obvious loop and mask it inside of the recursion
    guard let head = input.first else {return []}
    if let headArray = head as? [Any] {
        return flatten(input: headArray) + flatten(input: Array(input.dropFirst()))
    }
    else {
        return [head] + flatten(input: Array(input.dropFirst()))
    }*/
    
    
    /*for e in input {
        switch e {
        case let e as [Any]:
            outputArray += flatten(input: e)
        default:
            outputArray.append(e)
        }
    }*/
    
    /*
     // tail optimized solution
     func flatten(input: [Any], accumulated: [Any] = []) -> [Any] {
     guard let head = input.first else {return accumulated}
     if let headArray = head as? [Any] {
     return flatten(input: Array(input.dropFirst()), accumulated: flatten(input: headArray, accumulated: accumulated))
     }
     else {
     var _accumulated = accumulated
     _accumulated.append(head)
     
     return flatten(input:Array(input.dropFirst())), accumulated: _accumulated)
     }*/
 return outputArray

}




