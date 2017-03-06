//  LinkedList.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/1/17.
//  Copyright © 2017 Karan Satia. All rights reserved.

import Foundation

public class LinkedList {
    var head: Node?
    var tail: Node?
    var count: Int = 0
    
    enum ListError: Error {
        case Empty
        case End
    }
    
    func pushValueToList (value: Any) {
        
        let newNode = Node(value: value)
        
        if let tail = tail {
            
            tail.next = newNode
            newNode.next = nil
            self.tail = newNode
            
        }
        else {
            head = newNode
            tail = newNode
        }
        count+=1
    }
    
    //we could write this in as a subscript function and allow it to get and set values (for set value we would just call an insert:atIndex: function).
    func valueAtIndex (index:Int)->Any? {
     //use a neat guard statement to eliminate negative indices and indices greater than the list size
     guard index >= 0 && index < count else {
     fatalError("Index out of range")
     }
     switch(index) {
     case 0:
     return head?.value
     case count-1:
     return tail?.value
     default:
     //only need to create this var if we hit the default statement so put it here instead of at beginning of function
     var returnNode = head
     for _ in 0 ..< index {
     returnNode = returnNode!.next
     }
     return (returnNode?.value)
     }
     }
    
    //we could also include methods to removeNodeAtIndex and an init method
    
    
    func pairwiseSwap () -> Node? {
        return _pairWiseSwap(listHead: head!, firstRun: true)
        
    }
    
//    fileprivate func _pairWiseSwap (listHead: Node, firstRun:Bool) -> Node? {
//        //empty list check
//        guard count > 0 else {
//            return nil
//        }
//        //check for linked list with single node
//        guard listHead.next != nil else {
//            self.tail = listHead
//            return listHead
//        }
//
//        //this is 7
//        let nextToPass = listHead.next?.next
//        
//        //first run this is 5
//        let node1 = listHead
//        //first run this is 6
//        let node2 = node1.next
//        //adjust boolean so that we have the list head ivar set
//        if (firstRun) {
//            self.head = node2
//        }
//        //6 now points to 5
//        node2?.next = node1
//        //5 now points to 7 (we need to get it to point to 8)
//        if let passToFunc = nextToPass {
//            node2?.next = passToFunc
//            return _pairWiseSwap(listHead: passToFunc, firstRun: false)
//        }
//    }
//        return self
        
//}
}


//MARK "PROTOCOL EXTENSIONS"


extension LinkedList : Sequence {
    public func makeIterator() -> AnyIterator<Node> {
        var currentNode = self.head
        return AnyIterator {
            if let node = currentNode {
                defer { currentNode = node.next }
                return node
            } else {
                return nil
            }
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var currentIndex: Int = 0
        var description: String = ""
        if var currentNode = self.head {
            // while currentNode != nil {
            for _ in 0...count-1 {
                //description += (String(currentNode.value) + " " )
                description += ("\"" + (String(describing: currentNode.value)) + "\"" + " is at index: \(currentIndex)\n")
                if let nextNode = currentNode.next {
                    currentNode = nextNode
                    currentIndex += 1
                }
            }
        }
        return description
    }
}
