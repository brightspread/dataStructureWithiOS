import Foundation

/*
 Stack
 - Last In First Out
 
 Features
 - push
 - pop
 - top
 - size
 - isEmpty
 */

struct Stack <T> {
    private var stack: [T] = []
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func pop() -> T? {
        return stack.popLast()
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public func top() -> T? {
        return stack.last
    }
    
    public func size() -> Int {
        return stack.count
    }
}




