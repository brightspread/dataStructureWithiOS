
struct Stack <T> {
    private var stack: [T] = []
    
    public var isEmpty: Bool {
        return stack.count > 0
    }
    
    public mutating func pop() -> T? {
        let result = stack[stack.count - 1]
        stack = Array(stack[0...stack.count - 2])
        return result
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public func top() -> T? {
        return stack.last
    }
    
    public var size: Int {
        return stack.count
    }
}

var stack = Stack<Int>()
print("stack isEmpty: \(stack.isEmpty)")
stack.push(1)
stack.push(2)
stack.push(3)

print(stack)
print("top : \(stack.top())")

stack.pop()
print(stack)
print("stack.size : \(stack.size)")
