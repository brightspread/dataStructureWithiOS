import Foundation


/*
 First In First Out
 
 Enqueue
 Dequeue
 Peek : 맨 앞 데이터
 
 front index
 rear index
 */


struct Queue<T> {
    private var queue: [T?] = []
    private var front: Int = 0
    private var rear: Int {
        return queue.count - 1
    }
    private var isEmpty: Bool {
        return queue.isEmpty
    }
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    // O(N)
//    public mutating func dequeue() -> T? {
//        if isEmpty {
//            return nil
//        } else {
//            front += 1
//            return queue.removeFirst()
//        }
//    }
    public mutating func dequeue() -> T? {
        guard frontIndex <= rear, let element = queue[front] else {
            return nil
        }
        queue[front] = nil
        front += 1
        return element
    }

    public func peek() -> T? {
        return queue[frontIndex]
    }
    
    public var frontIndex: Int {
        return front
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.frontIndex
queue.enqueue(3)
queue.frontIndex
queue.dequeue()
queue.frontIndex
queue.dequeue()
queue.frontIndex
queue.dequeue()
queue.dequeue()
queue.frontIndex
