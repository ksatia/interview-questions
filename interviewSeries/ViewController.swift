//
//  ViewController.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/1/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.SumCombination()
        //self.testFlatten()
        //self.testNodeSwap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testFlatten (){
        let arr = [1, 2, 3, [1, 2, [1, 2, 3, 4]]] as [Any]
        print (flatten(input: arr))
    }
    
    func testNodeSwap() {
        let arr = [1, 4, 5, "any", ["any", [2, 3, 4]]] as [Any]
        //let arr = [1,2,3,4,5]
        let newList = LinkedList(array: arr)
        print(newList)
        /*print("testing swapped list")
        
        newList.head = newList.pairwiseSwap()
        print(newList)
        
        if let head = newList.head?.value {
            print(head)
        }
        
        if let tail = newList.tail?.value {
            print(tail)
        }*/
    }

    func SumCombination() {
        print (sumCombination(array: [1,2,3,4,5], sum: 9))
    }
}

