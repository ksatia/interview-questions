//  LinkedList.swift
//  interviewSeries
//
//  Created by Karan Satia on 3/1/17.
//  Copyright © 2017 Karan Satia. All rights reserved.

import Foundation
//THIS ISN'T WORKING FOR EVEN NUMBERED NODE LINKED LIST
public class LinkedList {
    var head: Node?
    var tail: Node?
    var count: Int = 0
    
    enum ListError: Error {
        case Empty
        case End
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    public init() {}
    
    convenience init(array: [Any]) {
        //convenience initializers must always call the designated initializer
        self.init()
        //var _array: [Any] = flatten(input: array)
        for element in array {
            self.pushValueToList(value: element)
        }
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
        //_pairWiseSwap(listHead: head, firstRun: true)
         return _recursivePairWiseSwap (listHead: head, firstRun: true)
    }
    
    
    fileprivate func _recursivePairWiseSwap (listHead: Node?, firstRun: Bool) -> Node? {
        //nil check, var newHead = listHead.next, listHead.next = swap pairs passing in newHead.next, newHead.next = listHead, return newHead
        guard (listHead != nil || listHead?.next != nil) else {
            listHead?.next = nil
            self.tail = listHead
            return listHead
        }
        if (firstRun) {
            self.head = listHead?.next
        }
        
        let newNode = listHead?.next
        guard newNode?.next != nil else {
            listHead?.next = nil
            self.tail = listHead
            return listHead
        }
        
        listHead?.next = _recursivePairWiseSwap(listHead: listHead?.next?.next, firstRun: false)
        newNode?.next = listHead
        return newNode
    }
    
    fileprivate func _pairWiseSwap (listHead: Node?, firstRun:Bool) {
        //we can use a dummy head that points to the head. var start = fakeHead. while start != nil and start.next != nil and start.next.next != nil -> var end = start.next.next, start.next.next = end.next, end.next = start.next, start.next = end, start = start.next.next, outside of the while loop just return fakeHead.next (actual head of list).
        
        //empty list check
        if (isEmpty) {
            fatalError("List is empty")
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

//this allows us to traverse a list with (for item in list)
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
    //we can use the above sequence protocol conformance to shorten our description variable to use map -> return "[" + self.map {String($0.value)}.joinWithSeparator(" ") + "]"
    
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

//we could add an extension here with a copy function. Create a new list, for...in loop and append nodes to the new list. Rename our LL as _LinkedList and wrap it in another class called LinkedList. _LinkedList is private and we expose some rewritten methods. We have two lists, one called storage and the other called mutableStorage. Mutable storage is a computed property that has a get. We check if storage is uniquely referenced. If it IS uniquely referenced, there is only one reference to it and we can just return storage. If it is NOT uniquely referenced, we have multiple references to it and need to call our copy method. For all non mutating functions, we call our storage.method which is the internal implementation. Then for mutating functions (append, remove, removeAtIndex) we call : mutableStorage.remove. 
