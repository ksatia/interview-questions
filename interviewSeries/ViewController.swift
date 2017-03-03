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
        let newList = LinkedList()
        newList.pushValueToList(value: 5)
        newList.pushValueToList(value: 6)
        newList.pushValueToList(value: 7)
        newList.pushValueToList(value: 8)
        newList.pushValueToList(value: 9)
        newList.pushValueToList(value: 10)
        print(newList)
        newList.pairwiseSwap()
        print("testing swapped list")
        print(newList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

