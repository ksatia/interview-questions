//
//  FlattenFunction.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/3/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import Foundation


func flatten (input: [Any]) -> [Any] {
    var mutableInput = input
    var outputArray = [Any] ()
    
    /*for i in 0..<input.count {
        let data = input[i]
        (data is [Any]) ?
            outputArray += flatten(input: data as! [Any]) :
            outputArray.append(data)
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
    while(mutableInput.count >= 0) {
        //let captured = mutableInput.shift()
        let captured = mutableInput.remove(at: 0)
        if var captured = captured as? [Any] {
            captured.append(mutableInput)
            mutableInput = captured
        }
        else {
            outputArray.append(captured)
        }
    }
    
    
 return outputArray

}

extension Array {
    mutating func shift() -> Any {
        guard self.count >= 0 else {
            fatalError("Array doesn't exist")
        }
        
        let element = self.first
        //dropFirst returns an ArraySlice object so we must cast it to an Array
        //Error message for self = self.dropFirst() doesn't tell us much - it says "missing argument for parameter #1 in call" which makes no sense since dropFirst has no parameters. Instead of assigning the dropFirst value directly to self, I assigned it to a variable and then made self = variable. This gave us the error message that we can't assign value of type ArraySlice to type Array. Better message - lesson to be learned is that the swift compiler often doesn't give accurate error messages so make sure you write code in several ways to try and get a more accurate error.
        self = Array(self.dropFirst())
        return element!
    }
}



