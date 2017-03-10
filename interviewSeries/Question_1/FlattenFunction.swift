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
    }
    
    for e in input {
        switch e {
        case let e as [Any]:
            outputArray += flatten(input: e)
        default:
            outputArray.append(e)
        }
    }*/
    
    return outputArray
}




