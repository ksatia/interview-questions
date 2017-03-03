//
//  FlattenFunction.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/3/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import Foundation

func flatten (input: [Any]) -> [Any] {
    let length = input.count;
    var outputArray = [Any] ()
    
    //output array += the array we are iterating over.flattened else output.append(item iterated over)
    /*for i in 0 ..< length {
     let data = input[i];
     if data is Array<Any> {
     //PROBLEM IS HERE, WE HIT INFINITE LOOP
     outputArray += flatten(input: [data]);
     }
     else {
     outputArray.append(data);
     }
     }*/
    
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
