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
    
    
    func pairwiseSwap () {
        _pairWiseSwap(listHead: head, firstRun: true)
    }
    
    fileprivate func _pairWiseSwap (listHead: Node?, firstRun:Bool) {
        //empty list check
        guard count > 0 else {
            fatalError("Index out of range")
        }
        
        //assume our input is ["a", "b", "c", "d"]
        
        //a
        var node1 = listHead
        //b
        var node2 = listHead?.next
        //c
        var tempNode = node2?.next

        //adjust boolean so that we have the list head ivar set
        if (firstRun) {
            self.head = node2
        }
        

        
        while(true) {

            //b points to a
            node2?.next = node1
            //and a should point to d
            node1?.next = tempNode?.next
            
            //now node 1 needs to point to c, node 2 needs to point to d and temp needs to point to e
            node1 = tempNode
            node2 = tempNode?.next
            tempNode = node2?.next
            
            guard node1 != nil else {
                node1?.next = nil
                self.tail = node1
                break
            }
        }
    }
    
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
