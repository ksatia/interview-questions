//
//  Node.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/1/17.
//  Copyright © 2017 Karan Satia. All rights reserved.
//

import Foundation

public class Node {
    var value: Any?
    var next: Node?
    var prev: Node?
    
    var isTail: Bool {
        return self.next == nil
    }
    var isHead: Bool {
        return self.prev == nil
    }
    
    init (value: Any?) {
        self.value = value
    }
}
