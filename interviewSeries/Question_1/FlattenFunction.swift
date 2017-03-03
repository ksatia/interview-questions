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
    
    for e in input {
        switch e {
        case let e as [Any]:
            outputArray += flatten(input: e)
        default:
            outputArray.append(e)
        }
    }
    
    return outputArray
}





